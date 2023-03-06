import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/core/logger/app_logger.dart';
import 'package:delivery_app/app/dto/order_dto.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/repository/order/order_repository.dart';

import 'order_state.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  final AppLogger _log;

  OrderController({
    required OrderRepository orderRepository,
    required AppLogger log,
  })  : _orderRepository = orderRepository,
        _log = log,
        super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentsTypes();
      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loaded,
        paymentTypes: paymentTypes,
      ));
    } catch (e, s) {
      _log.error('Erro ao carregar pagina', e, s);
      emit(state.copyWith(
          status: OrderStatus.error, errorMessage: 'Erro ao carregar página'));
    }
  }

  void incrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(
      state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder),
    );
  }

  void decrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    final amount = order.amount;

    if (amount == 1) {
      if (state.status != OrderStatus.confirmDeleteProduct) {
        emit(
          OrderConfirmDeleteProductState(
            orderProduct: order,
            index: index,
            status: OrderStatus.confirmDeleteProduct,
            orderProducts: state.orderProducts,
            paymentTypes: state.paymentTypes,
          ),
        );
        return;
      } else {
        orders.removeAt(index);
      }
    } else {
      orders[index] = order.copyWith(amount: order.amount - 1);
    }
    if(orders.isEmpty) {
      emit(state.copyWith(status: OrderStatus.emptyBag));
      return;
    }

    emit(
      state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder),
    );
  }

  void cancelDeleteProcess() {
    emit(state.copyWith(status: OrderStatus.loaded));
  }

  void emptyBag() {
    emit(state.copyWith(status: OrderStatus.emptyBag));
  }

  Future<void> saveOrder({required String address, required String document, required int paymentMethodId,}) async {
    emit(state.copyWith(status: OrderStatus.loading));

    try {
      await _orderRepository.saveOrder(
        OrderDto(
          products: state.orderProducts,
          address: address,
          document: document,
          paymentMethodId: paymentMethodId,
        ),
      );
      emit(state.copyWith(status: OrderStatus.success));
    } catch (e, s) {
      _log.error('Erro ao salvar pedido', e, s);

      emit(
        state.copyWith(
          status: OrderStatus.error,
          errorMessage: 'Erro ao salvar pedido',
        ),
      );
    }
  }
}
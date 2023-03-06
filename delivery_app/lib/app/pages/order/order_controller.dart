import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/repository/order/order_repository.dart';

import '../../core/logger/app_logger.dart';
import '../../dto/order_product_dto.dart';
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
        orderProduct: products,
        status: OrderStatus.loaded,
        paymentTypes: paymentTypes,
      ));
    } catch (e, s) {
      _log.error('Erro ao carregar pagina', e, s);
      emit(state.copyWith(status: OrderStatus.error, errorMessage: 'Erro ao carregar página'));
    }
  }
}

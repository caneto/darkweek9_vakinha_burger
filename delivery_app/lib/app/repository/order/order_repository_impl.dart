import 'package:delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:delivery_app/app/models/payment_type_model.dart';
import 'package:dio/dio.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../dto/order_dto.dart';
import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio _dio;
  final AppLogger _log;

  OrderRepositoryImpl({
    required CustomDio dio,
    required AppLogger log,
  })  : _dio = dio,
        _log = log;

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await _dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e,s) {
      _log.error('Erro ao buscar formas de pagamento', e, s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }

   @override
  Future<void> saveOrder(OrderDto order) async {
    try {
      await _dio.auth().post(
        '/orders',
        data: {
          'products': order.products
              .map(
                (e) => {
                  'id': e.product.id,
                  'amount': e.amount,
                  'total_price': e.totalPrice,
                },
              )
              .toList(),
          'user_id': '#userAuthRef',
          'address': order.address,
          'CPF': order.document,
          'payment_method_id': order.paymentMethodId,
        },
      );
    } on DioError catch (e, s) {
      _log.error('Erro ao salvar pedido', e, s);

      Error.throwWithStackTrace(
        RepositoryException(message: 'Erro ao salvar pedido'),
        s,
      );
    }
  }
}

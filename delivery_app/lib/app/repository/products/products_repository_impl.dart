import 'package:delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:dio/dio.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/custom_dio.dart';
import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio _dio;
  final AppLogger _log;

  ProductsRepositoryImpl({
    required CustomDio dio,
    required AppLogger log,
  })  : _dio = dio,
        _log = log;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final result = await _dio.unauth().get('/products');
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
    } on DioError catch (e, s) {
      _log.error('Erro ao buscar produtos', e, s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}

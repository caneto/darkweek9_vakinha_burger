import 'dart:io';

import 'package:delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:delivery_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:delivery_app/app/core/logger/app_logger.dart';
import 'package:delivery_app/app/models/auth_model.dart';
import 'package:dio/dio.dart';

import '../../core/rest_client/custom_dio.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio _dio;
  final AppLogger _log;

  AuthRepositoryImpl({
    required CustomDio dio,
    required AppLogger log,
  })  : _dio = dio,
        _log = log;

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await _dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });

      return AuthModel.fromMap(result.data);
    } on DioError catch (e,s) {
      _log.error('Erro ao realizar Login', e, s);
      throw RepositoryException(message: 'Erro ao realizar Login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await _dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e, s) {
      if(e.response?.statusCode == HttpStatus.forbidden) {
        _log.error('Permissão negada', e, s);
        throw UnauthorizedExceptions();
      }
      _log.error('Erro ao registrar usuário', e, s);
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }
}

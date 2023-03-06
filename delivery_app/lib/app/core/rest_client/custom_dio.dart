import 'package:delivery_app/app/core/rest_client/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

import '../helpers/constant/constants.dart';
import '../helpers/enviroment/enviroments.dart';

class CustomDio extends DioForNative {

  late AuthInterceptor _authInterceptor;

  CustomDio()
      : super(BaseOptions(
          baseUrl: Environments.params(Constants.envBaseUrlKey) ?? '',
          connectTimeout: int.parse(
            Environments.params(Constants.envRestClientConnectTimeout) ?? '0',
          ),
          receiveTimeout: int.parse(
            Environments.params(Constants.envRestClientReceiveTimeout) ?? '0',
          ),
        )) {
    interceptors.addAll([
      if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true, requestHeader: true),
    ]);

    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }
  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}

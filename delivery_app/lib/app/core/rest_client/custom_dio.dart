import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

import '../helpers/constant/constants.dart';
import '../helpers/enviroment/enviroments.dart';

class CustomDio extends DioForNative {
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
  }

  CustomDio auth() {
    return this;
  }
  CustomDio unauth() {
    return this;
  }
}

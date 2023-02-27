import 'package:delivery_app/app/core/logger/app_logger.dart';
import 'package:delivery_app/app/core/logger/app_logger_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../rest_client/custom_dio.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<AppLogger>(
          create: (context) => AppLoggerImpl(),
        )
      ],
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/register_controller.dart';
import 'register_page.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => RegisterController(
              authRepository: context.read(),
              log: context.read(),
            ),
          )
        ],
        child: const RegisterPage(),
      );
}

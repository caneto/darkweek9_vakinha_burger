import 'package:delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

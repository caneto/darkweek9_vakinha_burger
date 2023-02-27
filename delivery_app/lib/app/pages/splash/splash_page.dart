import 'package:delivery_app/app/core/ui/helpers/context_extension.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: ColorsApp.i.black,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    width: context.percentWidth(.6),
                    height: 35,
                    label: 'ACESSAR',
                    onPressed: () {
                      context.popAndPushNamed('/home');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

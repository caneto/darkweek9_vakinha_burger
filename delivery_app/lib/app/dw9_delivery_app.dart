import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatelessWidget {

  const Dw9DeliveryApp({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        routes: {
          '/':(context) => const SplashPage(),
        },
       );
  }
}
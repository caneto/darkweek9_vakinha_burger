import 'package:delivery_app/app/core/provider/application_binding.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/home/order/order_page.dart';
import 'package:delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'pages/auth/login/login_router.dart';
import 'pages/home/home_router.dart';
import 'pages/product_detail/product_detail_route.dart';
import 'pages/auth/register/register_router.dart';

class Dw9DeliveryApp extends StatelessWidget {

  const Dw9DeliveryApp({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return ApplicationBinding(
         child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Delivery App',
          theme: ThemeConfig.theme,
          routes: {
            '/':(context) => const SplashPage(),
            '/home': (context) => HomeRouter.page,
            '/productDetail':(context) => ProductDetailRoute.page,
            '/auth/login': (context) => LoginRouter.page,
            '/auth/register': (context) => RegisterRouter.page,
            '/order':(context) => const OrderPage(),
          },
         ),
       );
  }
}
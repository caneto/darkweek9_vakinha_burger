import 'package:delivery_app/app/pages/order/order_controller.dart';
import 'package:delivery_app/app/repository/order/order_repository.dart';
import 'package:delivery_app/app/repository/order/order_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_page.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(
              dio: context.read(),
              log: context.read(),
            ),
          ),
          Provider(
            create: (context) => OrderController(
              orderRepository: context.read(),
              log: context.read(),
            ),
          )
        ],
        child: const OrderPage(),
      );
}

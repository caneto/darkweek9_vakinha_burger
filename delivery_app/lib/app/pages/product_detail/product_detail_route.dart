import 'package:delivery_app/app/pages/product_detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailRoute {
  ProductDetailRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          )
        ],
        child: const ProductDetailPage(),
      );
}

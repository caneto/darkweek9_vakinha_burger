import 'package:delivery_app/app/core/ui/helpers/context_extension.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class ShoppingBagWiget extends StatelessWidget {

  final List<OrderProductDto> bag;

  const ShoppingBagWiget({ super.key, required this.bag });

   @override
   Widget build(BuildContext context) {
       return Container(
          width: context.width,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
       );
  }
}
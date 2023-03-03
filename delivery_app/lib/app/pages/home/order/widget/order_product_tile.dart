import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.network(
            'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'X-Burger',
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '19,90',
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 14,
                          color: ColorsApp.i.secudary,
                        ),
                      ),
                      DeliveryIncrementDecrementButton.compact(amaut: 1, incrementTap: (){}, decrementTap: (){})
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../styles/colors_app.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final bool _compact;
  final int amaut;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButton(
      {super.key,
      required this.amaut,
      required this.incrementTap,
      required this.decrementTap})
      : _compact = false;

  const DeliveryIncrementDecrementButton.compact(
      {super.key,
      required this.amaut,
      required this.incrementTap,
      required this.decrementTap})
      : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(5) : null,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '-',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: _compact ? 10 : 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Text(
            amaut.toString(),
            style: context.textStyles.textRegular.copyWith(
              fontSize: _compact ? 13 : 17,
              color: ColorsApp.i.secudary,
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: _compact ? 10 : 22,
                  color: ColorsApp.i.secudary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

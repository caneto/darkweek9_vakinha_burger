import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const DeliveryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

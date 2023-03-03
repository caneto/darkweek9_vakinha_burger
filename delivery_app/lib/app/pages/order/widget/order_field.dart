//import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;  
  
  const OrderField({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: context.textStyles.textRegular.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                ),
              ),
            ),
          ), */
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              labelText: title,
              labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 15, color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                gapPadding: 0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                gapPadding: 0,
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                gapPadding: 0,
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            inputFormatters: inputFormatters,
          )
        ],
      ),
    );
  }
}

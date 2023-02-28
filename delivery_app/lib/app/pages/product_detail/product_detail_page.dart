import 'package:delivery_app/app/core/ui/helpers/context_extension.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800'),
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Hamburger X",
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  "Descrição do Hambuger",
                  style: context.textStyles.textRegular.copyWith(fontSize: 12),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              const Text('Botão increment'),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Adicionar')))
            ],
          )
        ],
      ),
    );
  }
}

import 'package:brasil_fields/brasil_fields.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:delivery_app/app/pages/order/order_controller.dart';
import 'package:delivery_app/app/pages/order/widget/order_field.dart';
import 'package:delivery_app/app/pages/order/widget/payment_types_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validadores/Validador.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/base_state/base_state.dart';
import 'order_state.dart';
import 'widget/order_product_tile.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  final _formKey = GlobalKey<FormState>();

  final _enderecoEC = TextEditingController();
  final _cpfEC = TextEditingController();

  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Carrinho',
                      style: context.textStyles.textTitle,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/trashRegular.png'),
                    )
                  ],
                ),
              ),
            ),
            BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
              selector: (state) => state.orderProduct,
              builder: (context, orderProducts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: orderProducts.length,
                    (context, index) {
                      final orderProduct = orderProducts[index];
                      return Column(
                        children: [
                          OrderProductTile(
                            index: index,
                            orderProduct: orderProduct,
                          ),
                          const Divider(
                            color: Colors.grey,
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total do Pedido',
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          r'R$ 200,00',
                          style: context.textStyles.textExtraBold
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  OrderField(
                    title: 'Endereço de Entrega',
                    controller: _enderecoEC,
                    validator: Validatorless.required('Endereço obrigatório'),
                    hintText: 'Digite um endereço',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OrderField(
                    title: 'CPF',
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      CpfOuCnpjFormatter()
                    ],
                    controller: _cpfEC,
                    validator: (value) {
                      // Aqui entram as validações
                      return Validador()
                          .add(Validar.CPF, msg: 'CPF Inválido')
                          .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                          .minLength(11)
                          .maxLength(11)
                          .valido(value, clearNoNumber: true);
                    },
                    hintText: 'Digite o CPF',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const PaymentTypesFields()
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DeliveryButton(
                      width: double.infinity,
                      height: 48,
                      label: 'FINALIZAR',
                      onPressed: _order,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _order() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      //controller.register(
      //    name: _nameEC.text, email: _emailEC.text, password: _passwordEC.text);
    }
  }
}

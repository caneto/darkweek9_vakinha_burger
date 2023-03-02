import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyles.textTitle,
                ),
                Text(
                  'Preeche os campos abaixo para criar o seu cadastro',
                  style: context.textStyles.textMedium.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                DeliveryTextformField(
                  label: 'Nome',
                  controller: _nameEC,
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
                const SizedBox(
                  height: 20,
                ),
                DeliveryTextformField(
                  label: 'E-mail',
                  controller: _emailEC,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail inválido')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DeliveryTextformField(
                  label: 'Senha',
                  controller: _passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Senha Obrigatório'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DeliveryTextformField(
                  label: 'Confirmar senha',
                  obscureText: true,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Confirmar Senha Obrigatório'),
                      Validatorless.min(6, 'No mínimo 6 carecteres'),
                      Validatorless.compare(_passwordEC, 'Senha diferente de confirmar senha!')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: DeliveryButton(
                    width: double.infinity,
                    label: 'Cadastrar',
                    onPressed: _registerUser,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      //_controller.register(email: _loginEC.text, password: _passwordEC.text);
    }
  }
}

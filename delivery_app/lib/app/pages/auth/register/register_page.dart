import 'package:delivery_app/app/core/ui/helpers/context_extension.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_textform_field.dart';
import 'package:delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
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
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showSucesss('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSucesss('Cadastro realizado com sucesso');
            context.pop();
          }
        );
      },
      child: Scaffold(
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
                        Validatorless.compare(
                            _passwordEC, 'Senha diferente de confirmar senha!')
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
      ),
    );
  }

  void _registerUser() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      controller.register(name: _nameEC.text, email: _emailEC.text, password: _passwordEC.text);
    }
  }
}

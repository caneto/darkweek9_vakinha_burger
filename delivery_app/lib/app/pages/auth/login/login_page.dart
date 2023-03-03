import 'package:delivery_app/app/core/ui/helpers/context_extension.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app/app/pages/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/delivery_textform_field.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader(),
          loginError: () {
            hideLoader();
            showSucesss('Login ou senha invalidos');
          },
          error: () {
            hideLoader();
            showSucesss('Erro ao realizar login');
          },
          success: () {
            hideLoader();
            //showSucesss('Login realizado com Sucesso');
            context.pop(true);
          }
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textStyles.textTitle,
                      ),
                      const SizedBox(
                        height: 30,
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
                        height: 30,
                      ),
                      DeliveryTextformField(
                        label: 'Senha',
                        controller: _passwordEC,
                        obscureText: true,
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('Senha Obrigatório'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: DeliveryButton(
                          width: double.infinity,
                          label: 'ENTRAR',
                          onPressed: _loginUser,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não possui uma conta',
                        style: context.textStyles.textBold,
                      ),
                      TextButton(
                          onPressed: () => context.pushNamed('/auth/register'),
                          child: Text(
                            'Cadastre-se',
                            style: context.textStyles.textBold
                                .copyWith(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _loginUser() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      controller.login(email: _emailEC.text, password: _passwordEC.text);
    }
  }
}

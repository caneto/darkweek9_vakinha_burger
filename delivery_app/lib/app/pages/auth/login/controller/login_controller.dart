import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:delivery_app/app/core/logger/app_logger.dart';
import 'package:delivery_app/app/repository/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final AppLogger _log;

  LoginController({
    required AuthRepository authRepository,
    required AppLogger log,
  })  : _log = log,
        _authRepository = authRepository,
        super(const LoginState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.accessToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedExceptions catch (e,s) {
      _log.error('Login ou senha inválidos', e, s);
      emit(state.copyWith(status: LoginStatus.loginError, errorMessage: 'Login ou senha inválidos'));
    } catch(e,s) {
      _log.error('Erro ao realizar login', e, s);
      emit(state.copyWith(status: LoginStatus.error, errorMessage: 'Erro ao realizar login'));
    }
  }
}

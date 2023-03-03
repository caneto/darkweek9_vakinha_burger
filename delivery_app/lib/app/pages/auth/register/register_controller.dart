import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/repository/auth/auth_repository.dart';

import '../../../core/logger/app_logger.dart';
import 'register_state.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  final AppLogger _log;

  RegisterController({
    required AuthRepository authRepository,
    required AppLogger log,
  })  : _log = log,
        _authRepository = authRepository,
        super(const RegisterState.initial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));
      await _authRepository.register(name, email, password);
      emit(state.copyWith(status: RegisterStatus.success));
    } on Exception catch (e, s) {
      _log.error('Erro ao registrar usuário', e, s);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}

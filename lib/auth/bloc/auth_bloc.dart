import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:kualiva_merchant_mb/_repository/user/auth_repository.dart';
import 'package:kualiva_merchant_mb/auth/model/user_model.dart';
import 'package:kualiva_merchant_mb/common/utility/lelog.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));
    on<AuthStarted>(_onStarted);
    on<AuthLoggedIn>(_onLoggedIn);
  }

  void _onStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final bool tokenExist = await _authRepository.checkToken();

    LeLog.bd(this, _onStarted, 'Token Exist $tokenExist');
    if (tokenExist) {
      emit(AuthTokenExist());
    } else {
      emit(AuthTokenNotExist());
    }
  }

  void _onLoggedIn(
    AuthLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final res = await _authRepository.login(
        email: event.email,
        password: event.password,
      );
      LeLog.bd(this, _onLoggedIn, 'Login Success');
      emit(AuthLoginSuccess(userModel: res));
    } catch (e) {
      LeLog.bd(this, _onLoggedIn, e.toString());
      emit(AuthLoginFailure());
    }
  }
}

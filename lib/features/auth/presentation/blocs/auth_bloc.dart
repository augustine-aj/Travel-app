import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/signup_usecase.dart';

class AuthState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final User? user;

  const AuthState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.user,
  });
  AuthState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }
}

class LoginCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(AuthState());

  void login(String email, String password) async {
    emit(state.copyWith(isLoading: true));

    try {
      final user = await loginUseCase.execute(email, password);
      if (user != null) {
        emit(state.copyWith(isSuccess: true, user: user));
      } else {
        emit(state.copyWith(errorMessage: "Invalid email or password"));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: "An error occurred"));
    }
  }
}

class SignupCubit extends Cubit<AuthState> {
  final SignupUseCase signupUseCase;
  SignupCubit(this.signupUseCase) : super(AuthState());
  void signup(String username, String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await signupUseCase.execute(username, email, password);
      if (user != null) {
        emit(state.copyWith(isSuccess: true, user: user));
      } else {
        emit(state.copyWith(errorMessage: 'Email already exists'));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'An error occured!'));
    }
  }
}

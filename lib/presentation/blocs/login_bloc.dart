import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_use_case.dart';

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final User? user;

  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.user,
  });
  LoginState copywith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    User? user,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginState());

  void login(String email, String password) async {
    emit(state.copywith(isLoading: true));

    try {
      final user = await loginUseCase.execute(email, password);
      if (user != null) {
        emit(state.copywith(isSuccess: true, user: user));
      } else {
        emit(state.copywith(errorMessage: "Invalid email or password"));
      }
    } catch (e) {
      emit(state.copywith(errorMessage: "An error occurred"));
    }
  }
}

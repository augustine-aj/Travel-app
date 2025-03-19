import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:travel_app/features/auth/presentation/blocs/login_event.dart';
import 'package:travel_app/features/auth/presentation/blocs/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUsecase;
  LoginBloc(this.loginUsecase) : super(LoginState()) {
    on<OnLoginButtonPressed>(_onLoginPressed);
    on<TogglePasswordVisibility>(_onPasswordVisibilityChanged);
  }
  void _onLoginPressed(OnLoginButtonPressed event, Emitter<LoginState> emit) {}
  void _onPasswordVisibilityChanged(
    TogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}

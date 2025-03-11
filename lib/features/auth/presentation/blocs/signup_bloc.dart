import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/utils/validators.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_event.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_state.dart';

import '../../domain/usecases/signup_usecase.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase signupUseCase;
  SignupBloc(this.signupUseCase) : super(SignupState()) {
    on<OnUsernameChanged>(_onUsernameChanged);
    on<OnEmailChanged>(_onEmailChanged);
    on<OnPasswordChanged>(_onPasswordChanged);
    on<OnConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<OnSignupSubmitted>(_onSignupSubmitted);
  }
  void _onUsernameChanged(OnUsernameChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        isUsernameValid: Validators.isValidUsername(event.username),
      ),
    );
  }

  void _onEmailChanged(OnEmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(isEmailValid: Validators.isValidEmail(event.email)));
  }

  void _onPasswordChanged(OnPasswordChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        isPasswordValid: Validators.isValidPassword(event.password),
      ),
    );
  }

  void _onConfirmPasswordChanged(
    OnConfirmPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        isConfirmPasswordValid: Validators.isPasswordMatch(
          event.password,
          event.confirmPassword,
        ),
      ),
    );
  }

  Future<void> _onSignupSubmitted(
    OnSignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    if (!state.isUsernameValid ||
        !state.isEmailValid ||
        state.isConfirmPasswordValid && state.isPasswordValid == null) {
      emit(state.copyWith(errorMessage: 'Invalid user inputs!'));
    }
    emit(state.copyWith(isLoading: true));
    final result = await signupUseCase.execute(
      event.username,
      event.email,
      event.password,
    );
    if (result != null) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Unknown error!'));
    }
  }
}

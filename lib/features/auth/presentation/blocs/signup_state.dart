class SignupState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool isUsernameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  SignupState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isUsernameValid = false,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
  });
  SignupState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isUsernameValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
    );
  }
}

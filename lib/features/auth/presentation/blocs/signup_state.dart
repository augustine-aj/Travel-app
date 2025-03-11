class SignupState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool isUsernameValid;
  final bool isEmailValid;
  final String? isPasswordValid;
  final String? isConfirmPasswordValid;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  SignupState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isUsernameValid = false,
    this.isEmailValid = false,
    this.isPasswordValid,
    this.isConfirmPasswordValid,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });
  SignupState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isUsernameValid,
    bool? isEmailValid,
    String? isPasswordValid,
    String? isConfirmPasswordValid,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
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
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}

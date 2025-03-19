class SignupState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool isUsernameValid;
  final bool isEmailValid;
  final String password;
  final String? isPasswordValid;
  final String confirmPassword;
  final String? isConfirmPasswordValid;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  SignupState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isUsernameValid = false,
    this.isEmailValid = false,
    this.password = '',
    this.isPasswordValid,
    this.confirmPassword='',
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
    String? password,
    String? isPasswordValid,
    String? confirmPassword,
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
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}

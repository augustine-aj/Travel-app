class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final bool isEmailValid;
  final String? errorMessage;
  final String? isPasswordValid;
  final bool isPasswordVisible;
  LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isEmailValid = false,
    this.isPasswordValid,
    this.isPasswordVisible = false,
  });
  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isEmailValid,
    String? isPasswordValid,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: this.errorMessage,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

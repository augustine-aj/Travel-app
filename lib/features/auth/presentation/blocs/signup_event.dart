abstract class SignupEvent {}

class TogglePasswordVisibility extends SignupEvent {}

class ToggleConfirmPasswordVisibility extends SignupEvent {}

class OnUsernameChanged extends SignupEvent {
  final String username;
  OnUsernameChanged(this.username);
}

class OnEmailChanged extends SignupEvent {
  final String email;
  OnEmailChanged(this.email);
}

class OnPasswordChanged extends SignupEvent {
  final String password;
  OnPasswordChanged(this.password);
}

class OnConfirmPasswordChanged extends SignupEvent {
  final String password;
  final String confirmPassword;
  OnConfirmPasswordChanged({
    required this.password,
    required this.confirmPassword,
  });
}

class OnSignupSubmitted extends SignupEvent {
  final String username;
  final String email;
  final String password;
  OnSignupSubmitted(this.username, this.email, this.password);
}

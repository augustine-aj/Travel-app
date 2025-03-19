abstract class LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}

class OnLoginButtonPressed extends LoginEvent {
  String? email;
  String? password;
  OnLoginButtonPressed(this.email, this.password);
}

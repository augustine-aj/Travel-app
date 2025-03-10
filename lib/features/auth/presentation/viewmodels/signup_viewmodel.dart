import 'package:flutter/widgets.dart';
import 'package:travel_app/features/auth/presentation/blocs/auth_bloc.dart';

class SignupViewModel extends ChangeNotifier {
  final SignupCubit signupCubit;
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  SignupViewModel(this.signupCubit);
  void signup() {
    final username = usernameTextController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;
    signupCubit.signup(username, email, password);
  }

  @override
  void dispose() {
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
// validateEmail()
// validatePassword()
// validateConfirmPassword()
// submitSignupForm()
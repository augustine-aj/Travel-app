import 'package:flutter/material.dart';
import 'package:travel_app/presentation/blocs/login_bloc.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginCubit loginCubit;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  LoginViewModel(this.loginCubit);

  void login() {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    loginCubit.login(email, password);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}

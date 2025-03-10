import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/di/di.dart';
import '../../viewmodels/login_view_model.dart';

import '../../blocs/auth_bloc.dart';
import '../../widgets/image_background.dart';
import '../../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  //final TextEditingController emailTextController = TextEditingController();
  //final TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: BlocConsumer<LoginCubit, AuthState>(
            listener: (context, state) {
              if (state.isSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login Succesfull.')));
              } else if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
            },
            builder: (context, state) {
              final loginViewModel = LoginViewModel(context.read<LoginCubit>());
              return Stack(
                children: [
                  buildImageBackground(),
                  Center(
                    child: LoginForm(viewModel: loginViewModel, state: state),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

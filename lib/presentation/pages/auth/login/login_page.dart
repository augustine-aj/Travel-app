import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/presentation/viewmodels/login_view_model.dart';

import '../../../../domain/usecases/login_use_case.dart' show LoginUseCase;
import '../../../blocs/login_bloc.dart';
import '../../../widgets/image_background.dart';
import '../../../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  //final TextEditingController emailTextController = TextEditingController();
  //final TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(context.read<LoginUseCase>()),
          child: BlocConsumer<LoginCubit, LoginState>(
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

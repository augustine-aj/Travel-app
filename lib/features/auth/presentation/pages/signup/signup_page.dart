import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/di/di.dart';
import 'package:travel_app/features/auth/presentation/widgets/image_background.dart';
import 'package:travel_app/features/auth/presentation/widgets/signup_form.dart';

import '../../blocs/auth_bloc.dart';
import '../../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: BlocConsumer<SignupCubit, AuthState>(
            listener: (context, state) {
              if (state.isSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('SignupSuccessfull')));
              } else if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
            },
            builder: (context, state) {
              final signupViewModel = SignupViewModel(
                context.read<SignupCubit>(),
              );
              return Stack(
                children: [
                  buildImageBackground(),
                  Center(
                    child: SignupForm(viewModel: signupViewModel, state: state),
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

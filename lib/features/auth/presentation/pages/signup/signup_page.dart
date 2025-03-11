import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/di/di.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_state.dart';
import 'package:travel_app/features/auth/presentation/widgets/image_background.dart';
import 'package:travel_app/features/auth/presentation/widgets/signup_form.dart';

import '../../blocs/auth_bloc.dart';
import '../../blocs/signup_bloc.dart';
import '../../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<SignupBloc, SignupState>(
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
          child: Stack(
            children: [buildImageBackground(), Center(child: SignupForm())],
          ),
        ),
      ),
    );
  }
}

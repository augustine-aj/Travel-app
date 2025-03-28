import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/utils/constants.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_state.dart';
import 'package:travel_app/features/auth/presentation/widgets/text_form_field.dart';

import '../../../../core/utils/validators.dart';
import '../blocs/signup_bloc.dart';
import '../blocs/signup_event.dart';

class SignupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignupForm({super.key});
  @override
  Widget build(BuildContext context) {
    //String password = '';
    //String confirmPassword = '';
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildUsernameField(context),
                  kheight,
                  _buildEmailField(context),
                  kheight,
                  _buildPasswordField(context),
                  kheight,
                  _buildConfirmPasswordField(context),
                  kheight,
                  _buildSignUpButton(),
                  kheight,
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_buildUsernameField(context) {
  return buildTextFormField(
    label: 'Username',
    onChanged: (value) {
      BlocProvider.of<SignupBloc>(context).add(OnUsernameChanged(value));
    },
    prefixIcon: Icon(Icons.person),
    validator:
        (value) =>
            Validators.isValidUsername(value!) ? null : 'Invalid Username',

    autoValidateMode: AutovalidateMode.onUserInteraction,
  );
}

_buildEmailField(context) {
  return buildTextFormField(
    label: 'Email',
    prefixIcon: Icon(Icons.email),
    onChanged: (value) {
      BlocProvider.of<SignupBloc>(context).add(OnEmailChanged(value));
    },
    validator:
        (value) => Validators.isValidEmail(value!) ? null : 'Invalid Email',
    autoValidateMode: AutovalidateMode.onUserInteraction,
  );
}

Widget _buildPasswordField(BuildContext contex) {
  return BlocBuilder<SignupBloc, SignupState>(
    builder: (context, state) {
      bool isPasswordValid = Validators.isValidPassword(state.password) == null;
      return buildTextFormField(
        label: 'Password',
        prefixIcon: Icon(
          Icons.lock,
          color: isPasswordValid ? Colors.green : null,
        ),
        onChanged: (value) {
          //password = value;
          BlocProvider.of<SignupBloc>(context).add(OnPasswordChanged(value));
        },
        suffixIcon: IconButton(
          onPressed:
              () => context.read<SignupBloc>().add(TogglePasswordVisibility()),
          icon: Icon(
            BlocProvider.of<SignupBloc>(context).state.isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
        obscureText: !state.isPasswordVisible,
        validator: (value) => Validators.isValidPassword(value!),
        autoValidateMode: AutovalidateMode.onUserInteraction,
      );
    },
  );
}

Widget _buildConfirmPasswordField(context) {
  return BlocBuilder<SignupBloc, SignupState>(
    builder: (context, state) {
      final isPasswordMatched =
          Validators.isPasswordMatch(state.password, state.confirmPassword) ==
          null;
      return buildTextFormField(
        label: 'Confirm password',
        prefixIcon: Icon(
          Icons.lock,
          color: isPasswordMatched ? Colors.green : null,
        ),
        onChanged: (value) {
          BlocProvider.of<SignupBloc>(context).add(
            OnConfirmPasswordChanged(
              password: state.password,
              confirmPassword: value,
            ),
          );
        },
        suffixIcon: IconButton(
          onPressed:
              () => context.read<SignupBloc>().add(
                ToggleConfirmPasswordVisibility(),
              ),
          icon: Icon(
            state.isConfirmPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
        obscureText: !state.isConfirmPasswordVisible,
        validator:
            (value) => Validators.isPasswordMatch(state.password, value!),
        autoValidateMode: AutovalidateMode.onUserInteraction,
      );
    },
  );
}

Widget _buildSignUpButton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Text('Signup'),
  );
}

Widget _buildFooter() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Already have an account?'),
      SizedBox(width: 4),
      TextButton(onPressed: () {}, child: Text('Login')),
    ],
  );
}

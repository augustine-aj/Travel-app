import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/utils/constants.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_state.dart';
import 'package:travel_app/features/auth/presentation/widgets/text_form_field.dart';

import '../../../../core/utils/validators.dart';
import '../blocs/signup_bloc.dart';
import '../blocs/signup_event.dart';

class SignupForm extends StatelessWidget {
  //final SignupViewModel viewModel;
  //final AuthState state;
  //SignupForm({super.key, required this.viewModel, required this.state});
  //bool _isPasswordVisible = false;
  //bool _isConfirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  SignupForm({super.key});
  // passwordVisibilityButton(bool visibility) {
  //   return IconButton(
  //     icon: Icon(visibility ? Icons.visibility : Icons.visibility_off),
  //     onPressed: () {
  //       _isPasswordVisible = !visibility;
  //     },
  //   );
  // }

  // confirmPasswordVisibilityButton(bool visibility) {
  //   return IconButton(
  //     icon: Icon(visibility ? Icons.visibility : Icons.visibility_off),
  //     onPressed: () {
  //       _isConfirmPasswordVisible = !visibility;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String password = '';
    String confirmPassword = '';
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          //color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTextFormField(
                    //controller: viewModel.usernameTextController,
                    label: 'Username',
                    onChanged: (value) {
                      //print('Starts..');
                      BlocProvider.of<SignupBloc>(
                        context,
                      ).add(OnUsernameChanged(value));
                    },
                    prefixIcon: Icon(Icons.person),
                    validator:
                        (value) =>
                            Validators.isValidUsername(value!)
                                ? null
                                : 'Invalid Username',

                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  kheight,
                  buildTextFormField(
                    //: viewModel.emailTextController,
                    label: 'Email',
                    prefixIcon: Icon(Icons.email),
                    onChanged: (value) {
                      BlocProvider.of<SignupBloc>(
                        context,
                      ).add(OnEmailChanged(value));
                    },
                    validator:
                        (value) =>
                            Validators.isValidEmail(value!)
                                ? null
                                : 'Invalid Email',
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  kheight,
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      bool isPasswordValid =
                          Validators.isValidPassword(password) == null;
                      return buildTextFormField(
                        //controller: viewModel.passwordTextController,
                        label: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: isPasswordValid ? Colors.green : null,
                        ),
                        onChanged: (value) {
                          password = value;
                          BlocProvider.of<SignupBloc>(
                            context,
                          ).add(OnPasswordChanged(value));
                        },
                        suffixIcon: IconButton(
                          onPressed:
                              () => context.read<SignupBloc>().add(
                                TogglePasswordVisibility(),
                              ),
                          icon: Icon(
                            BlocProvider.of<SignupBloc>(
                                  context,
                                ).state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        obscureText: !state.isPasswordVisible,
                        validator:
                            (value) => Validators.isValidPassword(value!),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      );
                    },
                  ),
                  kheight,
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      final isPasswordMatched =
                          Validators.isPasswordMatch(
                            password,
                            confirmPassword,
                          ) ==
                          null;
                      return buildTextFormField(
                        label: 'Confirm password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: isPasswordMatched ? Colors.green : null,
                        ),
                        onChanged: (value) {
                          confirmPassword = value;
                          BlocProvider.of<SignupBloc>(context).add(
                            OnConfirmPasswordChanged(
                              password: password,
                              confirmPassword: confirmPassword,
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
                            (value) =>
                                Validators.isPasswordMatch(password, value!),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      );
                    },
                  ),
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

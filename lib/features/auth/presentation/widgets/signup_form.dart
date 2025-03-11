import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/utils/constants.dart';
import 'package:travel_app/features/auth/presentation/widgets/text_form_field.dart';

import '../../../../core/utils/validators.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/signup_bloc.dart';
import '../blocs/signup_event.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupForm extends StatelessWidget {
  //final SignupViewModel viewModel;
  //final AuthState state;
  //SignupForm({super.key, required this.viewModel, required this.state});
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  passwordVisibilityButton(bool visibility) {
    return IconButton(
      icon: Icon(visibility ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        _isPasswordVisible = !visibility;
      },
    );
  }

  confirmPasswordVisibilityButton(bool visibility) {
    return IconButton(
      icon: Icon(visibility ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        _isConfirmPasswordVisible = !visibility;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    //autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  kheight,
                  buildTextFormField(
                    //controller: viewModel.passwordTextController,
                    label: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    onChanged: (value) {
                      BlocProvider.of<SignupBloc>(
                        context,
                      ).add(OnPasswordChanged(value));
                    },
                    suffixIcon: passwordVisibilityButton(_isPasswordVisible),
                    obscureText: !_isPasswordVisible,
                    //validator: null,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  kheight,
                  buildTextFormField(
                    label: 'Confirm password',
                    prefixIcon: Icon(Icons.lock),

                    //onChanged:(value){BlocProvider.of(context).add(OnConfirmPasswordChanged(password: , confirmPassword:))}
                    suffixIcon: confirmPasswordVisibilityButton(
                      _isConfirmPasswordVisible,
                    ),
                    obscureText: !_isConfirmPasswordVisible,
                    //validator: (value) => confirmPasswordValidator(value),
                    autoValidateMode: AutovalidateMode.onUserInteraction,
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

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter a valid email';
  }
  return !RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
      ).hasMatch(value)
      ? 'Enter a valid email'
      : null;
}

// String? passwordValidator(String? value) {
//   // if (value == null || value.isEmpty) {
//   //   return 'Password cannot be empty';
//   // }
//   // if (value.length < 8) {
//   //   return 'Password must be at least 8 characters long';
//   // }
//   // if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
//   //   return 'Must contain at least one lowercase letter';
//   // }
//   // if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
//   //   return 'Must contain at least one uppercase letter';
//   // }
//   // if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
//   //   return 'Must contain at least one digit';
//   // }
//   // if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(value)) {
//   //   return 'Must contain at least one special character (@, \$, !, %, *, ?, &)';
//   // }
//   // return null;
// }

String? confirmPasswordValidator(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirm password cannot be empty';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null; // ✅ Passwords match
}

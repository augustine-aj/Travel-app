import 'package:flutter/material.dart';
import 'package:travel_app/features/auth/presentation/widgets/text_field.dart';

import '../../../../core/utils/constants.dart';
import '../blocs/auth_bloc.dart';
import '../viewmodels/login_view_model.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel viewModel;
  final AuthState state;
  const LoginForm({super.key, required this.viewModel, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
      child: SingleChildScrollView(
        // height: 350,
        // width: 300,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: .5),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Adventurer!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  kheight,
                  _buildEmailField(viewModel),
                  kheight,
                  //_buildPasswordField,
                  kheight,
                  ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    child: Text('Login'),
                  ),
                  kheight,
                  _buildCreateNewAccount(context),
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

_buildEmailField(viewModel) {
  return buildTextField(
    controller: viewModel.emailTextController,
    label: 'Email or Username',
    fontColor: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

// _buildPasswordField() {
//   return buildTextField(
//     controller: viewModel.passwordTextController,
//     label: 'Password',
//     fontColor: Colors.white,
//     fontWeight: FontWeight.bold,
//     suffixIcon: IconButton(
//       onPressed: () {},
//       icon: Icon(Icons.visibility),
//       color: Colors.black,
//     ),
//     obscureText: true,
//   );
// }

Widget _buildCreateNewAccount(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("New here? Let's get started!"),
      SizedBox(width: 4),
      TextButton(
        onPressed: () {},
        child: Text('Create an Account', style: TextStyle(color: Colors.blue)),
      ),
    ],
  );
}

Widget _buildFooter() {
  return Row(
    children: [
      Checkbox(value: false, onChanged: (value) {}),
      Text('Remember me'),
      Spacer(),
      Text('Forgot password?'),
    ],
  );
}

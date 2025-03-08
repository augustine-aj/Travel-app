import 'package:flutter/material.dart';

import '../blocs/login_bloc.dart';
import '../viewmodels/login_view_model.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel viewModel;
  final LoginState state;
  const LoginForm({super.key, required this.viewModel, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 300,
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
              SizedBox(height: 40),
              TextField(
                controller: viewModel.emailTextController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  label: Text(
                    'Email or Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: viewModel.passwordTextController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  label: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  //final email = emailTextController.text;
                  //final password = passwordTextController.text;
                  // context.read<LoginCubit>().login(
                  //   email,
                  //   password,
                  //);
                  viewModel.login();
                },
                child: Text('hy'),
              ),
              SizedBox(height: 20),
              Text("New here? Let's get started!"),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.blue,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ),
              //SizedBox(height: 20),
              Expanded(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.min,
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text('Remember me'),
                    Spacer(),
                    Text('forgot password?'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

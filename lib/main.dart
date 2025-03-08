import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/presentation/pages/auth/login/login_page.dart';

import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/login_use_case.dart';

void main() {
  final authRemoteDatasource = AuthRemoteDatasource();
  final authRepository = AuthRepositoryImpl(authRemoteDatasource);
  final loginUseCase = LoginUseCase(authRepository);

  runApp(
    RepositoryProvider(create: (_) => loginUseCase, child: const TravelApp()),
  );
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

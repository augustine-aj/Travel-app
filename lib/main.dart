import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_bloc.dart';
//import 'package:get_it/get_it.dart';
import 'package:travel_app/features/auth/presentation/pages/login/login_page.dart';
import 'package:travel_app/features/auth/presentation/pages/signup/signup_page.dart';

import 'core/di/di.dart';
import 'features/auth/presentation/blocs/auth_bloc.dart';
// import 'features/auth/data/datasources/auth_remote_datasource.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/auth/domain/usecases/login_use_case.dart';
//import 'features/auth/domain/usecases/signup_usecase.dart';
//import 'features/auth/presentation/blocs/auth_bloc.dart';

void main() {
  setupDI();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => getIt<LoginCubit>()),
        BlocProvider<SignupBloc>(create: (_) => getIt<SignupBloc>()),
      ],
      child: const TravelApp(),
    ),
    //RepositoryProvider(create: (_) => signupUseCase, child: const TravelApp()),
  );
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupPage());
  }
}

import 'package:get_it/get_it.dart';
import 'package:travel_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:travel_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:travel_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:travel_app/features/auth/presentation/blocs/signup_bloc.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/presentation/blocs/auth_bloc.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(),
  );

  // Fix: Register AuthRepositoryImpl as AuthRepository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDatasource>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(getIt<LoginUseCase>()),
  );

  getIt.registerLazySingleton<SignupBloc>(
    () => SignupBloc(getIt<SignupUseCase>()),
  );
}

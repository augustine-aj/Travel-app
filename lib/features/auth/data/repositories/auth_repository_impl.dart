import '../../domain/repositories/auth_repository.dart';

import '../../domain/entities/user.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<User?> login(String email, String password) async {
    final success = await remoteDataSource.login(email, password);
    return success ? User(email) : null;
  }

  @override
  Future<User?> signUp(String username, String email, String password) async {
    final success = await remoteDataSource.signUp(username, email, password);
    return success ? User(email) : null;
  }
}

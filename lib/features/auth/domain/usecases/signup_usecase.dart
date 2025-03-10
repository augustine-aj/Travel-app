import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;
  SignupUseCase(this.repository);
  Future<User?> execute(String username, String email, String password) {
    return repository.signUp(username, email, password);
  }
}

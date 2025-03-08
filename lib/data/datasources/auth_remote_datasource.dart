class AuthRemoteDatasource {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return email == 'sample@gmail.com' && password == '1234';
  }
}

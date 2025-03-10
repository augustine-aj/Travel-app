class AuthRemoteDatasource {
  Map<String, String> sampleDb = {
    'email': 'samplet@gmail.com',
    'password': '1234',
    'username': 'user1',
  };
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return sampleDb['email'] == email && sampleDb['password'] == password;
  }

  Future<bool> signUp(String username, String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (sampleDb['email'] == email) {
      return false;
    } else {
      sampleDb['email'] = email;
      sampleDb['password'] = password;
      return true;
    }
  }
}

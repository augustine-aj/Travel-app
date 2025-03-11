// isValidUsername(String username)
// isValidEmail(String email)
// isValidPassword(String password)
// isPasswordMatch(String password, String confirmPassword)
class Validators {
  static bool isValidUsername(String username) {
    final regex = RegExp(r'^[a-zA-Z0-9_]{3,}$');
    return regex.hasMatch(username);
  }

  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  static String? isValidPassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(password)) {
      return 'Must contain at least one lowercase letter';
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(password)) {
      return 'Must contain at least one uppercase letter';
    }
    if (!RegExp(r'^(?=.*\d)').hasMatch(password)) {
      return 'Must contain at least one digit';
    }
    if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(password)) {
      return 'Must contain at least one special character (@, \$, !, %, *, ?, &)';
    }
    return null;
    //return regex.hasMatch(password);
  }

  static String? isPasswordMatch(String password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirmpassword is required';
    }
    if (password != confirmPassword) return 'Password do not match';
    return null;
  }
}

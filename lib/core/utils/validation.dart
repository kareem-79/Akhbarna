class Validation {
  static bool isValidateEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email.trim());
  }

  static bool isValidatePassword(String password) {
    final value = password.trim();

    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChar = RegExp(r'[^\w\s]').hasMatch(value);
    final hasMinLength = value.length >= 8;
    return hasUpperCase && hasNumber && hasSpecialChar && hasMinLength;
  }
  static bool isPasswordMatch(String password, String confirmPassword) {
    return password.trim() == confirmPassword.trim();
  }
}

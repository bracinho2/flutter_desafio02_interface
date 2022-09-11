class Validators {
  static String? validateName(String? value) {
    if (value!.isEmpty) return 'Inform your name!';
    return null;
  }

  static String? validateCPF(value) {
    RegExp regExp = RegExp("([0-9]{3})\\.([0-9]{3})\\.([0-9]{3})-([0-9]{2})",
        caseSensitive: false);
    final result = regExp.hasMatch(value!);
    if (!result) {
      return 'Senha Inválida!';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Your email is empty.';
    RegExp regExp = RegExp("[a-z0-9]+@[a-z]+.[a-z]{2,3}", caseSensitive: false);
    final result = regExp.hasMatch(value);
    if (!result) {
      return 'Your email isn\n valid!';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Your password is empty.';
    RegExp regExp = RegExp("[0-9]", caseSensitive: false);
    final result = regExp.hasMatch(value);
    if (!result) {
      return 'Your Password is Wrong!';
    }
    return null;
  }
}

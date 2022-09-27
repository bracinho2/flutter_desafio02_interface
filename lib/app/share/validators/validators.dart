import 'package:flutter_desafio02_interface/app/share/dummy_data/contries.dart';

class Validators {
  static String? validateName(String? value) {
    if (value!.isEmpty) return 'Inform your name!';
    if (value.split(' ').length < 2) return 'You need inform name and lastname';
    return null;
  }

  static String? validateCPF(value) {
    RegExp regExp = RegExp("([0-9]{3})\\.([0-9]{3})\\.([0-9]{3})-([0-9]{2})",
        caseSensitive: false);
    final result = regExp.hasMatch(value!);
    if (!result) {
      return 'CPF Inválido!';
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
    if (value.length < 6) return 'Your password is too short.';

    RegExp haveNumber = RegExp("[0-9]", caseSensitive: false);
    RegExp haveLowerCase = RegExp("[a-z]", caseSensitive: true);
    RegExp haveUpperCase = RegExp("[A-Z]", caseSensitive: true);
    RegExp haveSpecialCaracters = RegExp("[.,!@#\$%&*]", caseSensitive: false);

    if (!haveNumber.hasMatch(value)) return 'Your password need numbers!';
    if (!haveLowerCase.hasMatch(value)) {
      return 'Your password need a lower case!';
    }

    if (!haveUpperCase.hasMatch(value)) {
      return 'Your password need an upper case!';
    }

    if (!haveSpecialCaracters.hasMatch(value)) {
      return 'You need an special caracterer!';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value!.length > 9 && value.length < 13) return 'Forgot a number?';
    RegExp onlyNumbers = RegExp("[\\d]{9,13}");
    if (!onlyNumbers.hasMatch(value)) return 'Forgot a number?';
    return null;
  }

  static String? validateDropDown(Country? value) =>
      value == null ? 'Select your Country' : null;
}

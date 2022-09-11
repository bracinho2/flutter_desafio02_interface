import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  bool loginValidate({
    required String email,
    required String password,
  }) {
    if (formKey.currentState!.validate()) {
      if (email == 'bracinho2@hotmail.com') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

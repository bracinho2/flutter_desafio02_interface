import 'package:flutter/material.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();
  bool registerValidate({
    required String email,
    required String password,
  }) {
    if (!formKey.currentState!.validate()) {
      if (email == 'bracinho2@hotmail.com' && password == 'Alex.123') {
        return true;
      }
    }
    return false;
  }
}

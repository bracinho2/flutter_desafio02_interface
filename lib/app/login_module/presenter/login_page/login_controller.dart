import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/dummy_user.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  bool loginValidate({
    required String email,
    required String password,
  }) {
    if (formKey.currentState!.validate()) {
      if (FakeUser.user == null) {
        return false;
      }

      if (email == FakeUser.user!.email &&
          password == FakeUser.user!.password) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

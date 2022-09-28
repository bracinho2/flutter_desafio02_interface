import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/navigation/app_navigator.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/dummy_user.dart';
import 'package:flutter_desafio02_interface/app/share/snake_bar_manager/snack_bar_manager.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  void loginValidate({
    required String email,
    required String password,
  }) {
    if (formKey.currentState!.validate()) {
      if (FakeUser.user == null) {
        SnackBarManager().showError(message: 'email or password wrong');
        return;
      }
      if (email == FakeUser.user!.email &&
          password == FakeUser.user!.password) {
        AppNavigator.go(AppNavigator.PROFILE);
      } else {
        SnackBarManager().showError(message: 'email or password wrong');
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/navigation/app_navigator.dart';
import 'package:flutter_desafio02_interface/app/login_module/domain/entities/user_entity.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/contries.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/dummy_user.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();

  registerValidate({
    required String name,
    required String cpf,
    required String email,
    required String phone,
    required String password,
    required Country? country,
  }) {
    if (formKey.currentState!.validate()) {
      FakeUser.user = UserEntity(
        name: name,
        cpf: cpf,
        email: email,
        phone: phone,
        password: password,
        country: country!,
      );
      print(FakeUser.user);
      AppNavigator().back();
      return;
    }
    return;
  }
}

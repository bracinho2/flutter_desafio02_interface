import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/image_picker.dart/image_picker.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/dummy_user.dart';

class ProfileController {
  final formKey = GlobalKey<FormState>();

  final IPickedImageDatasource _iPickedImageDatasource = ImagePickerImpl();
  File? file;

  void checkUser() {
    if (FakeUser.user != null) {}
  }

  Future<void> pickImage() async {
    final response = await _iPickedImageDatasource.getImage(loadCamera: false);

    if (response != null) {
      file = response;
      print(file!.path);
    }
  }
}

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

abstract class IPickedImageDatasource {
  Future<File?> getImage({required bool loadCamera});
}

class ImagePickerImpl implements IPickedImageDatasource {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<File?> getImage({required bool loadCamera}) async {
    if (loadCamera) {
      //implementar a camera;
    } else {
      try {
        final image = await _imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) return null;

        final imageTemporary = File(image.path);
        return imageTemporary;
      } on PlatformException catch (e) {
        print('Filed to pick image $e');
      }
      return null;
    }
    return null;
  }
}

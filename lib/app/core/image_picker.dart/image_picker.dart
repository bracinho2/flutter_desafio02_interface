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
    late final ImageSource source;
    if (loadCamera) {
      source = ImageSource.camera;
    } else {
      source = ImageSource.gallery;
    }

    try {
      final image = await _imagePicker.pickImage(source: source);
      if (image == null) return null;

      final imageTemporary = File(image.path);
      return imageTemporary;
    } on PlatformException catch (e) {
      print('Filed to pick image $e');
    }

    return null;
  }
}

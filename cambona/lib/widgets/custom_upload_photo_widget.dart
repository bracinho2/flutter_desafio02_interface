import 'dart:io';

import 'package:flutter/material.dart';

class CustomUploadPhotoWidget extends StatelessWidget {
  final VoidCallback onTap;
  final File? file;

  const CustomUploadPhotoWidget({
    Key? key,
    required this.onTap,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SizedBox(
          width: 110,
          height: 110,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  image: file != null
                      ? DecorationImage(
                          image: FileImage(file!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

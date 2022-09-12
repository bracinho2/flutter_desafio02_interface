import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;
  const TextTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 25,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

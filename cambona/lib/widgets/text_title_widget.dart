import 'package:cambona/cambona.dart';
import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final Widget title;
  const TextTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: Responsivity.automatic(32, mediaQueryData),
        bottom: Responsivity.automatic(24, mediaQueryData),
      ),
      child: title,
    );
  }
}

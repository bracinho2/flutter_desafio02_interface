import 'package:cambona/core/app_responsivity.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfirmButtonWidget extends StatelessWidget {
  final String title;
  void Function() onPressed;
  ConfirmButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: Responsivity.automatic(105, mediaQueryData),
        bottom: Responsivity.automatic(66, mediaQueryData),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
          fixedSize: MaterialStateProperty.all(
            Size(
              Responsivity.automatic(366, mediaQueryData),
              Responsivity.automatic(64, mediaQueryData),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

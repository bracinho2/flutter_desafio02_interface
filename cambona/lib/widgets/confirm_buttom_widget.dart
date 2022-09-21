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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 105, bottom: 66),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
          fixedSize: MaterialStateProperty.all(const Size(357.0, 64.0)),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

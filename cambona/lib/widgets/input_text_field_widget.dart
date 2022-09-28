import 'package:cambona/core/app_responsivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFieldWidget extends StatelessWidget {
  final Widget label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final bool obscure;
  final bool actionIcon;
  final List<TextInputFormatter>? inputFormatters;

  const InputTextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscure = false,
    this.actionIcon = false,
    required this.prefixIcon,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return TextFormField(
      decoration: InputDecoration(
        label: label,
        filled: false,
        prefixIcon: SizedBox(
          height: Responsivity.automatic(64, mediaQueryData),
          width: Responsivity.automatic(64, mediaQueryData),
          child: Icon(
            prefixIcon,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}

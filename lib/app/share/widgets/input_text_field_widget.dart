import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  String? Function(String?)? validator;
  bool obscure;
  bool actionIcon;
  InputTextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscure = false,
    this.actionIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        filled: false,
        suffixIcon: actionIcon ? const Icon(Icons.visibility) : null,
        prefixIcon: const SizedBox(
          height: 64,
          width: 64,
          child: Icon(
            Icons.person,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.0),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      controller: controller,
      validator: validator,
      obscureText: obscure,
    );
  }
}

import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final bool obscure;
  final bool actionIcon;
  InputTextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscure = false,
    this.actionIcon = false,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  State<InputTextFieldWidget> createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  bool showPassword = false;
  @override
  void initState() {
    super.initState();
    showPassword = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: const TextStyle(
            color: Colors.black38,
          ),
        ),
        filled: false,
        suffixIcon: widget.actionIcon
            ? InkWell(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: SizedBox(
                  height: 64,
                  width: 64,
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: showPassword ? Colors.blue : Colors.grey,
                  ),
                ),
              )
            : null,
        prefixIcon: SizedBox(
          height: 64,
          width: 64,
          child: Icon(
            widget.prefixIcon,
            color: Colors.blue,
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
      controller: widget.controller,
      validator: widget.validator,
      obscureText: showPassword,
    );
  }
}
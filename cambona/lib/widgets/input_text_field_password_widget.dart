import 'package:cambona/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFieldPasswordWidget extends StatelessWidget {
  final Widget label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  const InputTextFieldPasswordWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.suffixIcon = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputTextFieldWidget(
      label: label,
      controller: controller,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}

class InputTextFieldWidget extends StatefulWidget {
  final Widget label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final bool obscure;
  final bool suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const InputTextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscure = false,
    this.suffixIcon = false,
    required this.prefixIcon,
    this.inputFormatters,
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
        label: widget.label,
        filled: false,
        suffixIcon: widget.suffixIcon
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
                    color: showPassword
                        ? themeDataNormal.primaryColor
                        : Colors.grey,
                  ),
                ),
              )
            : null,
        prefixIcon: SizedBox(
          height: 64,
          width: 64,
          child: Icon(
            widget.prefixIcon,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: showPassword,
      inputFormatters: widget.inputFormatters,
    );
  }
}

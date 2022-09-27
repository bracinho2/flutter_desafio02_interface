import 'package:cambona/core/app_responsivity.dart';
import 'package:flutter/material.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final String label;
  final T? value;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>> items;

  const CustomDropDownWidget({
    Key? key,
    this.value,
    required this.onChanged,
    required this.label,
    required this.items,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return DropdownButtonFormField<T>(
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: SizedBox(
            height: Responsivity.automatic(64, mediaQueryData),
            width: Responsivity.automatic(64, mediaQueryData),
            child: const Icon(
              Icons.pin_drop_outlined,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          filled: false,
          label: const Text('Select your Country'),
          contentPadding: const EdgeInsets.all(0)),
      isExpanded: true,
      items: items,
      value: value,
      onChanged: onChanged,
    );
  }
}

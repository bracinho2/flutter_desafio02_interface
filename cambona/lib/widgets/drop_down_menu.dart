import 'package:cambona/cambona.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String label;
  final List<Country> data;
  final Function(String?)? onChanged;
  final Country? value;
  const DropDownWidget({
    Key? key,
    required this.data,
    required this.onChanged,
    required this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return DropdownButtonFormField<Country>(
      decoration: InputDecoration(
        prefixIcon: selected != true
            ? const SizedBox(
                height: 64,
                width: 64,
                child: Icon(
                  Icons.pin_drop_outlined,
                  color: Colors.blue,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        filled: false,
        labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.0),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      isExpanded: true,
      items: data.map<DropdownMenuItem<Country>>((Country value) {
        return DropdownMenuItem<Country>(
          value: value,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Text(value.flag),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(value.name),
            ],
          ),
        );
      }).toList(),
      value: value,
      onChanged: (value) {
        selected = !selected;
      },
    );
  }
}

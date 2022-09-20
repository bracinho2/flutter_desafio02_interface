import 'package:cambona/core/generics_dropdown.dart';
import 'package:cambona/dummy/contries.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String label;
  final List<Country> data;
  final Country? value;
  final Function(Country?) onChanged;

  const DropDownWidget({
    Key? key,
    this.value,
    required this.data,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  DropDownGenerics? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DropDownGenerics>(
      decoration: InputDecoration(
        prefixIcon: selected == null
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
        label: const Text('Select your Country'),
        //labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.0),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      isExpanded: true,
      items:
          widget.data.map<DropdownMenuItem<DropDownGenerics>>((Country value) {
        return DropdownMenuItem<DropDownGenerics>(
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
      value: selected,
      onChanged: (value) {
        widget.onChanged(value as Country);
        setState(() {
          selected = value;
        });
      },
    );
  }
}

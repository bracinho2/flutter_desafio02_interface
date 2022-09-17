import 'package:cambona/cambona.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String label;
  final List<Country> data;
  final Country? value;
  final Function(Country?) onChanged;

  DropDownWidget({
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
  Country? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Country>(
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
      items: widget.data.map<DropdownMenuItem<Country>>((Country value) {
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
      value: selected,
      onChanged: (value) {
        widget.onChanged.call(value);
        setState(() {
          selected = value;
        });
      },
    );
  }
}

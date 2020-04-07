import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class DropDownEstablishment extends StatefulWidget {
  const DropDownEstablishment({
    Key key,
  }) : super(key: key);

  @override
  _DropDownEstablishmentState createState() => _DropDownEstablishmentState();
}

class _DropDownEstablishmentState extends State<DropDownEstablishment> {
  String selected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selected,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          )
      ),
      items: ["Supermercados Metro", "Plaza vea", "Vivanda"]
          .map((label) => DropdownMenuItem(
        child: Text(label),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => selected = value);
      },
    );
  }
}

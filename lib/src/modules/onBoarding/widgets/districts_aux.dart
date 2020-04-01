import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class DropDownDistricts extends StatefulWidget {
  const DropDownDistricts({
    Key key,
  }) : super(key: key);

  @override
  _DropDownDistrictsState createState() => _DropDownDistrictsState();
}

class _DropDownDistrictsState extends State<DropDownDistricts> {
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
      items: ["San Borja", "San Luis", "La Victoria"]
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

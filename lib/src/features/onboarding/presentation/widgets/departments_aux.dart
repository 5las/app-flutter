import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class DropDownDepartments extends StatefulWidget {
  const DropDownDepartments({
    Key key,
  }) : super(key: key);

  @override
  _DropDownDepartmentsState createState() => _DropDownDepartmentsState();
}

class _DropDownDepartmentsState extends State<DropDownDepartments> {
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
      items: ["Lima", "Arequipa", "Tumbes"]
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


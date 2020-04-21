import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/data/models/company_model.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:flutter/material.dart';

class DropDownEstablishment extends StatefulWidget {
  final List<Company> companies;
  const DropDownEstablishment(this.companies, {
    Key key,
  }) : super(key: key);

  @override
  _DropDownEstablishmentState createState() => _DropDownEstablishmentState();
}

class _DropDownEstablishmentState extends State<DropDownEstablishment> {
  String selected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
      items: widget.companies.map((label) => DropdownMenuItem(
        child: Text(label.name.toString()),
        value: label.name,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => selected = value);
      },
    );
  }
}

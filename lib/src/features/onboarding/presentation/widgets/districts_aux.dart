import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:flutter/material.dart';

class DropDownDistricts extends StatefulWidget {
  final List<DistrictModel> districts;
  const DropDownDistricts(this.districts,   {
    Key key,
  }) : super(key: key);

  @override
  _DropDownDistrictsState createState() => _DropDownDistrictsState();
}

class _DropDownDistrictsState extends State<DropDownDistricts> {
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
      items:  widget.districts.map(
              (label) => DropdownMenuItem(
            child: Text(label.name.toString()),
            value: label.name,
          )
      ).toList(),
      onChanged: (value) {
        setState(() => selected = value);
      },
    );
  }
}

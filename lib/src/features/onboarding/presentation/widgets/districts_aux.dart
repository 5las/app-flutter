import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';

class DropDownDistricts extends StatefulWidget {
  final List<DistrictModel> districts;
  final OnBoardingBloc onBoardingBloc;
  const DropDownDistricts(this.districts, this.onBoardingBloc,{
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
            child: Text(label.name),
            value: label.id,
          )
      ).toList(),
      onChanged: (value) {
          setState(() {
            selected = value;
          });
          widget.onBoardingBloc.add(LoadCommercesEvent(districtId: int.parse(value)));
      },
    );
  }
}

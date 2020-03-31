import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class DefaultInputDecoration extends InputDecoration {
  String hintText;
  IconData suffixIconData;
  IconData prefixIconData;

  DefaultInputDecoration(
      {@required this.hintText, this.prefixIconData, this.suffixIconData})
      : super(
          suffixIcon: (suffixIconData != null)
              ? Icon(
                  suffixIconData,
                  color: AppColors.inputHintColor,
                )
              : null,
          prefixIcon: (prefixIconData != null)
              ? Icon(
                  prefixIconData,
                  color: AppColors.inputHintColor,
                )
              : null,
          filled: true,
          fillColor: Color(0xFFf4f9fc),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.inputHintColor),
          contentPadding:
              const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 12.0),
          
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2),
            borderRadius: BorderRadius.circular(14.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(14.0),
          ),
        );
}

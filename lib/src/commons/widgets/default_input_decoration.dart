import 'package:flutter/material.dart';

class DefaultInputDecoration extends InputDecoration {
  String hintText;
  Icon suffixIcon;
  Icon prefixIcon;

  DefaultInputDecoration({@required this.hintText, this.prefixIcon, this.suffixIcon})
      : super(
          suffixIcon: (suffixIcon != null) ? suffixIcon : null,
          prefixIcon: (prefixIcon != null) ? prefixIcon : null,
          filled: true,
          fillColor: Color(0xFFf4f9fc),
          hintText: hintText,
          contentPadding:
              const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 12.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(14.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(14.0),
          ),
        );
}

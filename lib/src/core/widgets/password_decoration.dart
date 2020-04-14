import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class PasswordDecoration extends InputDecoration {
  bool obscureText;
  Function onTap;

  PasswordDecoration({@required this.obscureText, @required this.onTap})
      : super(
          hoverColor: AppColors.black,
          suffixIcon: Container(
            child: (obscureText)
                ? GestureDetector(
                    onTap: onTap,
                    child: Icon(
                        Icons.visibility,
                        color: AppColors.inputHintColor,
                    ),
                  )
                : GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      Icons.visibility_off,
                      color: AppColors.inputHintColor,
                    ),
                  ),
          ),
          filled: true,
          fillColor: Color(0xFFf4f9fc),
          hintText: 'Contraseña',
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

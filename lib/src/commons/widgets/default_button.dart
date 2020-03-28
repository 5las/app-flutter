import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color backgroundColor;
  Color textColor;

  DefaultButton(
      {this.text = '',
      this.onPressed,
      this.backgroundColor = AppColors.primaryColor,
      this.textColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return ButtonTheme(
      minWidth: _mediaQuery.size.width * 0.85,
      height: 42.0,
      buttonColor: backgroundColor,
      child: RaisedButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        color: backgroundColor,
        elevation: 0,
        textColor: textColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(letterSpacing: 1.5),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      ),
    );
  }
}

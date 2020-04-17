import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color backgroundColor;
  Color textColor;
  Color borderColor;
  bool elevation;
  Widget widget;

  DefaultButton(
      {@required this.text,
      @required this.onPressed,
        this.widget,
        this.borderColor = AppColors.primaryColor,
      this.backgroundColor = AppColors.primaryColor,
      this.textColor = Colors.white, this.elevation = false});
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return ButtonTheme(
      minWidth: _mediaQuery.size.width * 0.9,
      height: 48.0,
      buttonColor: backgroundColor,
      child: RaisedButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        color: backgroundColor,
        elevation: (elevation) ? 2.0 : 0,
        textColor: textColor,
        onPressed: onPressed,
        child: (widget!=null)?
            widget: Text(
          text,
          style: TextStyle(letterSpacing: 1.5),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(14.0),
            side: BorderSide(color: borderColor)
        ),
      ),
    );
  }
}

import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';

class ShadowedBox extends StatelessWidget {
  Widget child;
  double width;
  double height;

  ShadowedBox({@required this.child, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width != null) ? width : null,
      height: (height != null) ? height : null,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
              color: AppColors.backgroundColorDark,
              blurRadius: 6,
              spreadRadius: 2.0,
              offset: Offset(0, 6))
        ],
      ),
      child: Padding(padding: EdgeInsets.all(10.0), child: child),
    );
  }
}

import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appColors = AppColors._internal();

  factory AppColors() {
    return _appColors;
  }

  AppColors._internal();

  static const int primary = 0xFFe20030;
  static const int opaqueSurface = 0xFFf4f9fc;

  static const Color textColor = Color(0xFF000000);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  
  static const MaterialColor primaryColor = MaterialColor(primary, <int, Color>{
    40: Color(0xFFea466a),
    60: Color(0xFFe73158),
    80: Color(0xFFe51a46),
    100: Color(primary),
    120: Color(0xFFd6002d)
  });

  static const MaterialColor opaqueSurfaceColor =
      MaterialColor(opaqueSurface, <int, Color>{100: Color(opaqueSurface)});
}

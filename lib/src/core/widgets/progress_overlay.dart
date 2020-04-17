import 'package:app_5las/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressOverlay {
  OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createdProgressEntry(context);
    Overlay.of(context).insert(_progressOverlayEntry);
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry.remove();
      _progressOverlayEntry = null;
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return OverlayEntry(
        builder: (BuildContext context) => Stack(
              children: <Widget>[
                Container(color: Colors.black.withOpacity(0.4)),
                Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                    size: 50.0,
                  ),
                )
              ],
            ));
  }
}

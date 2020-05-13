
import 'package:app_5las/src/config/colors.dart';
import 'package:app_5las/src/config/sizes.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String message;

  InfoDialog({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 72.0,
                color: AppColors.primaryColor[120],
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textColor),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: AppColors.primaryColor[120],
            ),
          )
        ],
      ),
    );
  }
}

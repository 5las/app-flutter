import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dialogs{
  static void alert(BuildContext context,
      {
        title = '',
        message: '',
        VoidCallback onOk
      }){
      showDialog(context: context, builder: (context){
       return CupertinoAlertDialog(
         title:
         Text(title,
         style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0
          ),
         ),
         content: Text(
           message,
           style: TextStyle(
               fontWeight: FontWeight.w500, fontSize: 16.0
           ),
         ),
         actions: <Widget>[
           CupertinoDialogAction(
             onPressed: (){
               Navigator.pop(context);
             },
             child: Text('OK'),
           )
         ],
       );
      });
  }
}
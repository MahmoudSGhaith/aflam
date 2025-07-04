
import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static Future<bool?> toastMsg(String message, Color backGroundColor,
      Color textColor) {
    return Fluttertoast.showToast(msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: backGroundColor,
        textColor: textColor,
        fontSize: 20);
  }
}

import 'package:flutter/material.dart';

import 'app_styles.dart';
import 'colors_manger.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              Center(
                child: CircularProgressIndicator(color: ColorsManger.white),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(message, style: AppStyles.white16medium),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (negAction != null) {
              negAction();
            }
          },
          child: Text(
            negActionName,
            style: AppStyles.white20medium.copyWith(color: Colors.red),
          ),
        ),
      );
    }

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) {
              posAction();
            }
          },
          child: Text(
            posActionName,
            style: AppStyles.white16medium.copyWith(
                color: ColorsManger.white),
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorsManger.white,
          title: title != null
              ? Text(title, style: AppStyles.white16medium)
              : null,
          content: Text(message, style: AppStyles.white16medium),
          actions: actions,
        );
      },
    );
  }
}

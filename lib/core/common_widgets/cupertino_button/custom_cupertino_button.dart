import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';


class CustomCupertinoButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final void Function()? onPress;

  const CustomCupertinoButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.backgroundColor,
    required this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: borderColor, width: 3),
      ),
      child: CupertinoButton(
        color: backgroundColor,
        child: Text(text, style: AppStyles.black18medium.copyWith(color: textColor())),
        onPressed: onPress,
      ),
    );
  }
  Color textColor(){
      if (backgroundColor == ColorsManger.yellow) {
        return Colors.black;
      } else if (backgroundColor == Colors.black) {
        return ColorsManger.yellow;
      } else if (backgroundColor == ColorsManger.red) {
        return Colors.white;
      } else {
        return Colors.white;
      }
  }
}

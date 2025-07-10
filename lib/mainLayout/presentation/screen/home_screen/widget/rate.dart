import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_styles.dart';
import '../../../../../core/colors_manger.dart';


class Rate extends StatelessWidget {
  final String imagePath;
  final String rate;
  final Color backgroundColor;
  final double right;
  final double left;
  final double top;
  final double bottom;

  const Rate({
    super.key,
    required this.imagePath,
    required this.rate,
    required this.backgroundColor,
    required this.right ,
    required this.left ,
    required this.top ,
    required this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 7.h),
      margin: EdgeInsets.only(left: left, right: right, top: top , bottom: bottom),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      width: 110.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(rate, style: AppStyles.white20medium),
          Image(
            image: AssetImage(imagePath),
            width: 30.w,
            height: 30.h,
            color: ColorsManger.yellow,
          ),
        ],
      ),
    );
  }
}

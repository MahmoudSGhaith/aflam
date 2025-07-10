
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_styles.dart';
import '../../../../../core/colors_manger.dart';



class GenresDetails extends StatelessWidget {
  final String text;
  const GenresDetails({super.key , required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 125.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: ColorsManger.grey,
      ),
      child: Text(text , style: AppStyles.white18medium,),
    );
  }
}

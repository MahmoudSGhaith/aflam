
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_styles.dart';



class MoviesDetailsTitle extends StatelessWidget {
  final String title;
  const MoviesDetailsTitle({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      alignment: Alignment.centerLeft,
      child: Text(title, style: AppStyles.white20medium),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_styles.dart';
import '../../../../../core/colors_manger.dart';

class CastInformation extends StatelessWidget {
  final String imagePath;
  final String actressName;
  final String characterDetails;

  const CastInformation({
    super.key,
    required this.imagePath,
    required this.actressName,
    required this.characterDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          Image.network(
            imagePath,
            width: 100.w,
            height: 100.h,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, size: 100.w),
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name : $actressName", style: AppStyles.white16medium),
                  Text(
                    "Character : $characterDetails",
                    style: AppStyles.white16medium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
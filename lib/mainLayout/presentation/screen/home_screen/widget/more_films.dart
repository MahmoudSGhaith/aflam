// ✅ تم التعديل: تمرير التقييم الحقيقي من الـ API وعرضه في الـ UI

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/mainLayout/presentation/screen/home_screen/widget/rate.dart';

import '../../../../../core/assets_manger.dart';
import '../../../../../core/colors_manger.dart';

class MoreFilms extends StatelessWidget {
  final String imagePath;
  final String rating; // ✅ التقييم القادم من API

  const MoreFilms({
    super.key,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 270.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Stack(
          children: [
            Image.network(
              imagePath,
              width: 190.w,
              height: 270.h,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
            Rate(
              left: 5.w,
              right: 50.w,
              top: 10.w,
              bottom: 0,
              imagePath: AssetsManger.star,
              rate: rating,
              backgroundColor: ColorsManger.grey.withAlpha(170),
            ),
          ],
        ),
      ),
    );
  }
}

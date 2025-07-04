
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomCarouselSlider extends StatelessWidget {
  final String imagePath;
  const CustomCarouselSlider({super.key , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imagePath),
      width: 120.w,
      height: 120.w, // Bigger height
      fit: BoxFit.fill,
    );
  }
}

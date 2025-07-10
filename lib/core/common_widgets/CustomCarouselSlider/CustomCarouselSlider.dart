import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatelessWidget {
  final String imagePath;
  const CustomCarouselSlider({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: Image.network(
        imagePath,
        width: 234.w,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, color: Colors.grey);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_styles.dart';
import 'colors_manger.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManger.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManger.black,
      elevation: 2,
      iconTheme: IconThemeData(color: ColorsManger.yellow, size: 25),
    ),
    scaffoldBackgroundColor: ColorsManger.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 2,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: ColorsManger.white,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.red,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.white,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.grey,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      fillColor: ColorsManger.white,
      labelStyle: AppStyles.white16mediumOpacity60,
      errorStyle: AppStyles.red14medium,
      hintStyle: AppStyles.white16medium,
      filled: true,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManger.red,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      prefixIconColor: ColorsManger.white,
      outlineBorder: BorderSide(
        color: ColorsManger.grey,
        strokeAlign: 2,
        width: 2,
      ),
      iconColor: ColorsManger.white,
    ),
  );
}

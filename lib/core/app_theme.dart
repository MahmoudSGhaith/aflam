import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_styles.dart';
import 'colors_manger.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManger.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorsManger.black,
      elevation: 2,
      iconTheme: IconThemeData(color: ColorsManger.white, size: 25),
    ),
    scaffoldBackgroundColor: ColorsManger.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManger.lightGrey ,
      selectedItemColor: ColorsManger.yellow,
      unselectedItemColor: ColorsManger.white,
      elevation: 2,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: ColorsManger.white,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManger.red,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManger.white,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
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
        borderSide: const BorderSide(
          color: ColorsManger.red,
          width: 2,
          strokeAlign: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      prefixIconColor: ColorsManger.white,
      outlineBorder: const BorderSide(
        color: ColorsManger.grey,
        strokeAlign: 2,
        width: 2,
      ),
      iconColor: ColorsManger.white,
    ),
  );
}
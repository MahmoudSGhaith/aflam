
import 'package:flutter/material.dart';
import 'package:movies/authentication/presentation/screens/reset_password/reset_password.dart';
import 'package:movies/onBoarding/onBoarding2.dart';
import 'package:movies/onBoarding/onBoarding3.dart';
import 'package:movies/onBoarding/onBoarding4.dart';
import 'package:movies/onBoarding/onBoarding5.dart';
import 'package:movies/onBoarding/onBoarding6.dart';

import '../authentication/presentation/screens/forget_password_screen/forget_password_screen.dart';
import '../authentication/presentation/screens/login_screen/login_screen.dart';
import '../authentication/presentation/screens/regiester_screen/regiester_screen.dart';
import '../authentication/presentation/screens/update_profile_screen/update_profile_screen.dart';
import '../onBoarding/onBoarding1.dart';

class AppRoutes {
  static const String onBoarding1Screen = "/onBoarding1";
  static const String onBoarding2Screen = "/onBoarding2";
  static const String onBoarding3Screen = "/onBoarding3";
  static const String onBoarding4Screen = "/onBoarding4";
  static const String onBoarding5Screen = "/onBoarding5";
  static const String onBoarding6Screen = "/onBoarding6";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String forgetPasswordScreen = "/forgetPassword";
  static const String updateProfileScreen = "/updateProfileScreen";
  static const String resetPasswordScreen = "/resetPasswordScreen";

  static Map<String , WidgetBuilder> routes = {
    onBoarding1Screen : (context) => const Onboarding1(),
    onBoarding2Screen : (context) => const Onboarding2(),
    onBoarding3Screen : (context) => const Onboarding3(),
    onBoarding4Screen : (context) => const Onboarding4(),
    onBoarding5Screen : (context) => const Onboarding5(),
    onBoarding6Screen : (context) => const Onboarding6(),
    loginScreen : (context) => const LoginScreen(),
    registerScreen : (context) => const RegiesterScreen(),
    forgetPasswordScreen : (context) => const ForgetPasswordScreen(),
    updateProfileScreen : (context) => const UpdateProfileScreen(),
    resetPasswordScreen : (context) => const ResetPasswordScreen(),
  };
}
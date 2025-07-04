
import 'package:flutter/material.dart';
import 'package:movies/onBoarding/onBoarding2.dart';
import 'package:movies/onBoarding/onBoarding3.dart';
import 'package:movies/onBoarding/onBoarding4.dart';
import 'package:movies/onBoarding/onBoarding5.dart';
import 'package:movies/onBoarding/onBoarding6.dart';

import '../onBoarding/onBoarding1.dart';


class AppRoutes {
  static const String onBoarding1Screen = "/onBoarding1";
  static const String onBoarding2Screen = "/onBoarding2";
  static const String onBoarding3Screen = "/onBoarding3";
  static const String onBoarding4Screen = "/onBoarding4";
  static const String onBoarding5Screen = "/onBoarding5";
  static const String onBoarding6Screen = "/onBoarding6";

  static Map<String , WidgetBuilder> routes = {
    onBoarding1Screen : (context) => const Onboarding1(),
    onBoarding2Screen : (context) => const Onboarding2(),
    onBoarding3Screen : (context) => const Onboarding3(),
    onBoarding4Screen : (context) => const Onboarding4(),
    onBoarding5Screen : (context) => const Onboarding5(),
    onBoarding6Screen : (context) => const Onboarding6(),
  };
}
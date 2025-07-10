import 'package:flutter/material.dart';
import 'package:movies/authentication/presentation/screens/reset_password/reset_password.dart';
import 'package:movies/mainLayout/presentation/screen/mainLayout.dart';
import 'package:movies/onBoarding/onBoarding1.dart';
import 'package:movies/onBoarding/onBoarding2.dart';
import 'package:movies/onBoarding/onBoarding3.dart';
import 'package:movies/onBoarding/onBoarding4.dart';
import 'package:movies/onBoarding/onBoarding5.dart';
import 'package:movies/onBoarding/onBoarding6.dart';
import '../authentication/presentation/screens/forget_password_screen/forget_password_screen.dart';
import '../authentication/presentation/screens/login_screen/login_screen.dart';
import '../authentication/presentation/screens/regiester_screen/regiester_screen.dart';
import '../authentication/presentation/screens/update_profile_screen/update_profile_screen.dart';
import '../mainLayout/presentation/screen/explore_screen/explore_screen.dart';
import '../mainLayout/presentation/screen/home_screen/home_screen.dart';
import '../mainLayout/presentation/screen/home_screen/movies_details/movies_details.dart';
import '../mainLayout/presentation/screen/search_screen/search_screen.dart';

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
  static const String mainLayout = "/mainLayout";
  static const String homeScreen = "/Home";
  static const String searchScreen = "/searchScreen";
  static const String exploreScreen = "/exploreScreen";
  static const String moviesDetails = "/moviesDetails";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding1Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding1());
      case onBoarding2Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding2());
      case onBoarding3Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding3());
      case onBoarding4Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding4());
      case onBoarding5Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding5());
      case onBoarding6Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding6());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegiesterScreen());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case updateProfileScreen:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case exploreScreen:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case moviesDetails:
        final args = settings.arguments;
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => MoviesDetails(movieId: args),
          );
        }
        return _errorRoute("Movie ID is missing or invalid");
      default:
        return _errorRoute("No route defined for ${settings.name}");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}

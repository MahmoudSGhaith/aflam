import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:page_transition/page_transition.dart';

import 'onBoarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManger.onBoardingGradient1_1,
                ColorsManger.onBoardingGradient1_2,
                ColorsManger.onBoardingGradient1_3,
                ColorsManger.onBoardingGradient1_4,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [
              const Image(
                image: AssetImage(AssetsManger.onBoarding1),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Find Your Next",
                        style: AppStyles.white30medium,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Favorite Movie Here",
                        style: AppStyles.white30medium,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Center(
                      child: Text(
                        "Get access to a huge library of movies\nto suit all tastes. You will surely like it.",
                        style: AppStyles.white16mediumOpacity60,
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    CustomCupertinoButton(
                      borderColor: ColorsManger.yellow,
                      backgroundColor: ColorsManger.yellow,
                      text: "Explore Now",
                      onPress: () {
                        Next(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Next(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rotate,
        alignment: Alignment.center,
        child:  Onboarding2(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}

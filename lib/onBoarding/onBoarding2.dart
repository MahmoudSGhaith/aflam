import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/onBoarding/onBoarding3.dart';
import 'package:page_transition/page_transition.dart';
import '../core/assets_manger.dart';
import '../core/app_routes.dart';
import '../core/app_styles.dart';
import '../core/colors_manger.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManger.onBoardingGradient2_1,
              ColorsManger.onBoardingGradient2_2,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Image(
              image: AssetImage(AssetsManger.onBoarding2),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 260.h,
                decoration: BoxDecoration(
                  color: ColorsManger.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.r),
                    topRight: Radius.circular(70.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Discover Movies", style: AppStyles.white24bold),
                      Text(
                        "Explore a vast collection of movies in all",
                        style: AppStyles.white16bold,
                      ),
                      Text(
                        "qualities and genres. Find your next",
                        style: AppStyles.white16bold,
                      ),
                      Text(
                        "favorite film with ease.",
                        style: AppStyles.white16bold,
                      ),
                      Container(
                        width: double.infinity,
                        child: CustomCupertinoButton(
                          backgroundColor: ColorsManger.yellow,
                          borderColor: ColorsManger.yellow,
                          text: "Next",
                          onPress: () {
                            Next(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Next(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child:  Onboarding3(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}

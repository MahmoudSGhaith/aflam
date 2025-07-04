
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:page_transition/page_transition.dart';
import '../core/assets_manger.dart';
import '../core/app_styles.dart';
import '../core/colors_manger.dart';
import 'onBoarding2.dart';
import 'onBoarding4.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManger.onBoardingGradient3_1,
              ColorsManger.onBoardingGradient3_2,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Image(
              image: AssetImage(AssetsManger.onBoarding3),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 360.h,
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
                      Text("Explore All Genres", style: AppStyles.white24bold),
                      Text(
                        "Discover movies from every genre, in all",
                        style: AppStyles.white16bold,
                      ),
                      Text(
                        "available qualities. Find something new",
                        style: AppStyles.white16bold,
                      ),
                      Text(
                        "and exciting to watch every day.",
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
                      Container(
                        width: double.infinity,
                        child: CustomCupertinoButton(
                          borderColor: ColorsManger.yellow,
                          backgroundColor: ColorsManger.black,
                          text: "Back",
                          onPress: () {
                            Back(context);
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
        type: PageTransitionType.rightToLeftJoined,
        childCurrent: this,
        child:  Onboarding4(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  Back(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.topToBottom,
        child: Onboarding2(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}


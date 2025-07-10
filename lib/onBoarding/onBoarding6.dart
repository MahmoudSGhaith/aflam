
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/onBoarding/onBoarding5.dart';
import 'package:page_transition/page_transition.dart';
import '../authentication/presentation/screens/login_screen/login_screen.dart';
import '../core/assets_manger.dart';
import '../core/app_styles.dart';
import '../core/colors_manger.dart';
import 'onBoarding3.dart';
import 'onBoarding4.dart';
import 'onBoarding6.dart';

class Onboarding6 extends StatelessWidget {
  const Onboarding6({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManger.onBoardingGradient5_1,
              ColorsManger.onBoardingGradient5_2,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Image(
              image: AssetImage(AssetsManger.onBoarding6),
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
                height: 250.h,
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
                      Text("Start Watching Now", style: AppStyles.white24bold),
                      Container(
                        width: double.infinity,
                        child: CustomCupertinoButton(
                          borderColor: ColorsManger.yellow,
                          backgroundColor: ColorsManger.yellow,
                          text: "Finish",
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
        type: PageTransitionType.bottomToTopPop,
        childCurrent: this,
        child:  LoginScreen(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  Back(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.topToBottomPop,
        childCurrent: this,
        child: Onboarding5(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}


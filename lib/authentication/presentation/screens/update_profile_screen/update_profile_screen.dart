import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/l10n/app_localizations.dart';
import '../../../../core/app_routes.dart';
import '../../../../core/colors_manger.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String defaultAvatar = AssetsManger.player1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.pickAvatar,
          style: AppStyles.yellow20medium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(AssetsManger.player1),
                width: 150.w,
                height: 150.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15.h),
              //user name
              CustomTextFormField(
                filledColor: ColorsManger.grey,
                prefixIcon: Icon(Icons.person, size: 30),
                textLabel: AppLocalizations.of(context)!.username,
                labelStyle: AppStyles.white20medium,
              ),
              SizedBox(height: 15.h),
              //phone number
              CustomTextFormField(
                filledColor: ColorsManger.grey,
                prefixIcon: Icon(Icons.phone, size: 30),
                textLabel: AppLocalizations.of(context)!.phoneNumber,
                labelStyle: AppStyles.white20medium,
              ),
              SizedBox(height: 15.h),
              //reset password
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    //todo : goto forget password screen
                    Navigator.pushNamed(context, AppRoutes.resetPasswordScreen);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.resetPassword,
                    style: AppStyles.white16medium,
                  ),
                ),
              ),
              SizedBox(height: 220.h,),
              CustomCupertinoButton(
                text: AppLocalizations.of(context)!.deleteAccount,
                onPress: () {},
                backgroundColor: ColorsManger.red,
                borderColor: ColorsManger.red,
              ),
              SizedBox(height: 15.h),
              CustomCupertinoButton(
                text: AppLocalizations.of(context)!.updateData,
                onPress: () {
                  showModalBottomSheet(
                    backgroundColor: ColorsManger.grey,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      final List<String> avatars = [
                        AssetsManger.player1,
                        AssetsManger.player2,
                        AssetsManger.player3,
                        AssetsManger.player4,
                        AssetsManger.player5,
                        AssetsManger.player6,
                        AssetsManger.player7,
                        AssetsManger.player8,
                        AssetsManger.player9,
                      ];
                      return Container(
                        padding: EdgeInsets.all(5.h),
                        height: 390.h,
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                          childAspectRatio: 1,
                          children: List.generate(avatars.length, (index) {
                            return InkWell(
                              onTap: () {
                                // todo: update selected avatar
                                setState(() {
                                  defaultAvatar = avatars[index];
                                });
                                Navigator.pop(context);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  avatars[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
                backgroundColor: ColorsManger.yellow,
                borderColor: ColorsManger.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

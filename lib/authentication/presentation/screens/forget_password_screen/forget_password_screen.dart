import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: AppStyles.yellow20medium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          children: [
            const Image(image: AssetImage(AssetsManger.forgetPassword)),
            SizedBox(height: 15.h,),
            CustomTextFormField(
              borderColor: ColorsManger.grey,
              filledColor: ColorsManger.grey,
              prefixIcon: const Icon(Icons.email, size: 30),
              textLabel: AppLocalizations.of(context)!.email,
              labelStyle: AppStyles.white16medium,
            ),
            SizedBox(height: 10.h,),
            Container(
              width: double.infinity,
              child: CustomCupertinoButton(
                borderColor: ColorsManger.yellow,
                backgroundColor: ColorsManger.yellow,
                text: AppLocalizations.of(context)!.verifyEmail,
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

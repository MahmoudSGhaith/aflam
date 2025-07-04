import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/authentication/app_services/network_services.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories_impl.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source_impl.dart';
import 'package:movies/authentication/presentation/cubits/auth_cubit/reset_password_cubit.dart';
import 'package:movies/authentication/presentation/cubits/auth_state/reset_password_states.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/l10n/app_localizations.dart';

import '../../../../core/app_routes.dart';
import '../../../../core/app_validator.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late bool showOldPasswordSecure = true;
  late bool showNewPasswordSecure = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResetPasswordCubit(
            AuthRepositoriesImpl(AuthDataSourceImpl(NetworkServices())),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.resetPassword,
            style: AppStyles.yellow20medium,
          ),
        ),
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
          listener: (context, state) {
            if(state is ResetPasswordLoading){
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  backgroundColor: ColorsManger.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.waiting,
                        style: AppStyles.black18medium,
                      ),
                      Lottie.asset('assets/images/loading.json', height: 200.h),
                    ],
                  ),
                ),
              );
            }
            else if(state is ResetPasswordSuccess){
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: ColorsManger.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/images/resetpassword.json',
                        height: 200.h,
                      ),
                      Text('ResetPassword Success', style: AppStyles.yellow16medium),
                    ],
                  ),
                ),
              );
              Future.delayed(const Duration(seconds: 2), () {
                //todo : remove onBoarding1 and replace it with home screen
                Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              });
            }
            else if(state is ResetPasswordError){
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: ColorsManger.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset('assets/images/error.json', height: 200.h),
                      Text(
                        state.errorMessage ?? "",
                        style: AppStyles.yellow16medium,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = ResetPasswordCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(AssetsManger.resetPassword),
                        width: 400.w,
                        height: 400.h,
                      ),
                      CustomTextFormField(
                        validator: AppValidator.validatePassword,
                        controller: cubit.oldPasswordController,
                        isObscureText: showOldPasswordSecure,
                        filledColor: ColorsManger.grey,
                        prefixIcon: const Icon(Icons.lock, size: 30),
                        textLabel: AppLocalizations.of(context)!.old_password,
                        labelStyle: AppStyles.white20medium,
                        suffixIcon: IconButton(
                          onPressed: showOldPassword,
                          icon: Icon(
                            showOldPasswordSecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        validator: AppValidator.validatePassword,
                        controller: cubit.newPasswordController,
                        isObscureText: showNewPasswordSecure,
                        filledColor: ColorsManger.grey,
                        prefixIcon: Icon(Icons.lock, size: 30),
                        textLabel: AppLocalizations.of(context)!.new_password,
                        labelStyle: AppStyles.white20medium,
                        suffixIcon: IconButton(
                          onPressed: showNewPassword,
                          icon: Icon(
                            showNewPasswordSecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 120.h),
                      CustomCupertinoButton(
                        text: AppLocalizations.of(context)!.resetPassword,
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            cubit.resetPassword();
                          }
                        },
                        backgroundColor: ColorsManger.yellow,
                        borderColor: ColorsManger.yellow,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showOldPassword() {
    showOldPasswordSecure = !showOldPasswordSecure;
    setState(() {});
  }

  void showNewPassword() {
    showNewPasswordSecure = !showNewPasswordSecure;
    setState(() {});
  }
}

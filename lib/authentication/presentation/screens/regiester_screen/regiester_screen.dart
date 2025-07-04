import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/authentication/app_services/network_services.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories_impl.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source_impl.dart';
import 'package:movies/authentication/presentation/cubits/auth_cubit/register_cubit.dart';
import 'package:movies/authentication/presentation/cubits/auth_state/register_states.dart';
import 'package:movies/core/app_validator.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/CustomCarouselSlider/CustomCarouselSlider.dart';
import 'package:movies/core/common_widgets/change_app_language/change_app_language.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/l10n/app_localizations.dart';
import '../../../../core/app_routes.dart';
import '../../../../core/app_toast.dart';

class RegiesterScreen extends StatefulWidget {
  const RegiesterScreen({super.key});

  @override
  State<RegiesterScreen> createState() => _RegiesterScreenState();
}

class _RegiesterScreenState extends State<RegiesterScreen> {
  late bool showPasswordSecure = true;
  late bool showRePasswordSecure = true;
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        AuthRepositoriesImpl(AuthDataSourceImpl(NetworkServices())),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.register,
            style: AppStyles.yellow20medium,
          ),
        ),
        body: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if(state is SignUpLoading){
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
            else if(state is SignUpSuccess){
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: ColorsManger.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/images/signupSuccess.json',
                        height: 200.h,
                      ),
                      Text('SignUp Success', style: AppStyles.yellow16medium),
                    ],
                  ),
                ),
              );
              Future.delayed(const Duration(seconds: 2), () {
                //todo : remove onBoarding1 and replace it with home screen
                Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              });
            }
            else if(state is SignUpError){
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
            final cubit = RegisterCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 150.h,
                      child: Container(
                        alignment: Alignment.center,
                        width: 380.w,
                        height: 180.h,
                        child: CarouselSlider(
                          items: const [
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player1,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player2,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player3,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player4,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player5,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player6,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player7,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player8,
                            ),
                            CustomCarouselSlider(
                              imagePath: AssetsManger.player9,
                            ),
                          ],
                          options: CarouselOptions(
                            height: 135.h,
                            enlargeCenterPage: true,
                            viewportFraction: 0.35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text("Avatar", style: AppStyles.white16medium),
                    SizedBox(height: 5.h),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // user name
                          CustomTextFormField(
                            validator: AppValidator.validateFullName,
                            controller: cubit.userNameController,
                            filledColor: ColorsManger.grey,
                            prefixIcon: Icon(Icons.person, size: 30),
                            textLabel: AppLocalizations.of(context)!.username,
                            labelStyle: AppStyles.white20medium,
                          ),
                          SizedBox(height: 10.h),
                          //email
                          CustomTextFormField(
                            validator: AppValidator.validateEmail,
                            controller: cubit.emailController,
                            filledColor: ColorsManger.grey,
                            prefixIcon: Icon(Icons.email, size: 30),
                            textLabel: AppLocalizations.of(context)!.email,
                            labelStyle: AppStyles.white20medium,
                          ),
                          SizedBox(height: 10.h),
                          //password
                          CustomTextFormField(
                            validator: AppValidator.validatePassword,
                            controller: cubit.passwordController,
                            isObscureText: showPasswordSecure,
                            filledColor: ColorsManger.grey,
                            prefixIcon: Icon(Icons.lock, size: 30),
                            textLabel: AppLocalizations.of(context)!.password,
                            labelStyle: AppStyles.white20medium,
                            suffixIcon: IconButton(
                              onPressed: showPassword,
                              icon: Icon(
                                showPasswordSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          //re_password
                          CustomTextFormField(
                            validator: (value) =>
                                AppValidator.validateConfirmPassword(
                                  cubit.passwordController.text,
                                  value,
                                ),
                            controller: cubit.rePasswordController,
                            isObscureText: showRePasswordSecure,
                            filledColor: ColorsManger.grey,
                            prefixIcon: Icon(Icons.lock, size: 30),
                            textLabel: AppLocalizations.of(context)!.rePassword,
                            labelStyle: AppStyles.white20medium,
                            suffixIcon: IconButton(
                              onPressed: showRePassword,
                              icon: Icon(
                                showRePasswordSecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          //phone number
                          CustomTextFormField(
                            validator: AppValidator.validatePhoneNumber,
                            controller: cubit.phoneNumberController,
                            keyboardType: TextInputType.number,
                            filledColor: ColorsManger.grey,
                            prefixIcon: Icon(Icons.phone, size: 30),
                            textLabel: AppLocalizations.of(
                              context,
                            )!.phoneNumber,
                            labelStyle: AppStyles.white20medium,
                          ),
                          SizedBox(height: 10.h),
                          //create account
                          CustomCupertinoButton(
                            backgroundColor: ColorsManger.yellow,
                            borderColor: ColorsManger.yellow,
                            text: AppLocalizations.of(context)!.createAccount,
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                cubit.signUp();
                              }
                            },
                          ),
                          SizedBox(height: 5.h),
                          // go to login screen
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(
                                  context,
                                )!.alreadyHaveAccount,
                                style: AppStyles.white16medium,
                              ),
                              TextButton(
                                onPressed: () {
                                  //todo : create new account .. go to register screen
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.loginScreen,
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.login,
                                  style: AppStyles.yellow16medium,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          ChangeAppLanguage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showPassword() {
    showPasswordSecure = !showPasswordSecure;
    setState(() {});
  }

  void showRePassword() {
    showRePasswordSecure = !showRePasswordSecure;
    setState(() {});
  }
}

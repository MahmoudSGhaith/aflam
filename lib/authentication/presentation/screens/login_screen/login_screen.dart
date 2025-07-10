import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories_impl.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source_impl.dart';
import 'package:movies/authentication/presentation/cubits/auth_cubit/login_cubit.dart';
import 'package:movies/authentication/presentation/cubits/auth_state/login_states.dart';
import 'package:movies/core/app_validator.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/change_app_language/change_app_language.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/authentication/app_services/network_services.dart';
import 'package:movies/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool showPasswordSecure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        AuthRepositoriesImpl(AuthDataSourceImpl(NetworkServices())),
      ),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
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
            else if (state is LoginSuccessState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: ColorsManger.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/images/loginSuccess.json',
                        height: 200.h,
                      ),
                      Text('Login Success', style: AppStyles.yellow16medium),
                    ],
                  ),
                ),
              );
              Future.delayed(const Duration(seconds: 2), () {
                //todo : remove onBoarding1 and replace it with home screen
                Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
              });
            }
            else if (state is LoginErrorState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: ColorsManger.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset('assets/images/error.json', height: 200.h),
                      const Text(
                        "Email or Password is incorrect"
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = LoginCubit.get(context);
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 70.h),
                      Image(
                        image: const AssetImage(AssetsManger.mainLogo),
                        width: 120.w,
                        height: 120.h,
                      ),
                      SizedBox(height: 50.h),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            //email_text_form_field
                            CustomTextFormField(
                              validator: AppValidator.validateEmail,
                              controller: cubit.emailController,
                              borderColor: ColorsManger.grey,
                              filledColor: ColorsManger.grey,
                              prefixIcon: Icon(Icons.email, size: 30),
                              textLabel: AppLocalizations.of(context)!.email,
                              labelStyle: AppStyles.white16medium,
                            ),
                            SizedBox(height: 25.h),
                            //password_text_form_field
                            CustomTextFormField(
                              validator: AppValidator.validatePassword,
                              controller: cubit.passwordController,
                              isObscureText: showPasswordSecure,
                              borderColor: ColorsManger.grey,
                              filledColor: ColorsManger.grey,
                              prefixIcon: Icon(Icons.lock, size: 30),
                              textLabel: AppLocalizations.of(context)!.password,
                              labelStyle: AppStyles.white16medium,
                              suffixIcon: IconButton(
                                onPressed: showPassword,
                                icon: Icon(Icons.visibility_off),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            // reset_password
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  //todo : goto forget password screen
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.resetPasswordScreen,
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.resetPassword,
                                  style: AppStyles.yellow16medium,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            //login button
                            SizedBox(
                              width: double.infinity,
                              child: CustomCupertinoButton(
                                borderColor: ColorsManger.yellow,
                                backgroundColor: ColorsManger.yellow,
                                text: AppLocalizations.of(context)!.login,
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.login();
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 15.h),
                            //create account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dontHaveAccount,
                                  style: AppStyles.white14medium,
                                ),
                                TextButton(
                                  onPressed: () {
                                    //todo : create new account .. go to register screen
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.registerScreen,
                                    );
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.createAccount,
                                    style: AppStyles.yellow14medium,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(height: 15.h),
                            const ChangeAppLanguage(),
                          ],
                        ),
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

  void showPassword() {
    showPasswordSecure = !showPasswordSecure;
    setState(() {});
  }
}

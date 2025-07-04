import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/provider/language_provider.dart';
import 'package:provider/provider.dart';

import 'core/app_routes.dart';
import 'l10n/app_localizations.dart';

class Aflam extends StatefulWidget {
  final String? token;
  const Aflam({super.key , this.token});

  @override
  State<Aflam> createState() => _AflamState();
}

class _AflamState extends State<Aflam> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      builder: (context, child) {
        var provider = Provider.of<LanguageProvider>(context);
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darkTheme,
              routes: AppRoutes.routes,
              //todo : remove onBoarding1 and replace it with home screen
              initialRoute: AppRoutes.loginScreen,
              //initialRoute: widget.token == null ?  AppRoutes.loginScreen : AppRoutes.onBoarding1,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              locale: Locale(provider.currentLanguage),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/language_provider.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'l10n/app_localizations.dart';

class Aflam extends StatelessWidget {
  final String? token;
  const Aflam({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          initialRoute: AppRoutes.mainLayout,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          locale: Locale(languageProvider.currentLanguage),
        );
      },
    );
  }
}

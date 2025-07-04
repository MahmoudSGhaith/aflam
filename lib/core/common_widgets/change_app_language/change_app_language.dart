
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/provider/language_provider.dart';
import 'package:provider/provider.dart';

class ChangeAppLanguage extends StatefulWidget {

  const ChangeAppLanguage({super.key});

  @override
  State<ChangeAppLanguage> createState() => _ChangeAppLanguageState();
}

class _ChangeAppLanguageState extends State<ChangeAppLanguage> {
  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<LanguageProvider>(context);
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.h,
      ),
      child: Row(
        textDirection: configProvider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
        children: [
          Text(AppLocalizations.of(context)!.language, style: AppStyles.white20medium),
          Spacer(),
          //animated toggle style
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 50.h,
            ),
            width: 100.w,
            height: 50.h,
            child: AnimatedToggleSwitch<String>.rolling(
              current: configProvider.currentLanguage,
              values: ["en", "ar"],
              onChanged: (newLanguage) {
                configProvider.changeAppLanguage(newLanguage);
              },
              style: ToggleStyle(
                backgroundColor: Colors.transparent,
                borderColor: ColorsManger.yellow,
                indicatorColor: ColorsManger.yellow,
              ),
              indicatorSize: Size(
                50.w , 50.h
              ),
              iconList: [
                Image(
                  image: AssetImage(AssetsManger.english),
                  width: 100.w,
                ),
                Image(
                  image: AssetImage(AssetsManger.arabic),
                  width: 100.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

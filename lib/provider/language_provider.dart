import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{

  String currentLanguage = "en";
  bool get isEnglish => currentLanguage == "en";
  void changeAppLanguage(String newLanguage){
    if(currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
}
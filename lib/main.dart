import 'package:flutter/material.dart';
import 'package:movies/provider/language_provider.dart';
import 'package:provider/provider.dart';

import 'aflam.dart';
import 'authentication/app_services/storage_service.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await StorageService.getToken();
  runApp(

    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Aflam(token: token,),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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

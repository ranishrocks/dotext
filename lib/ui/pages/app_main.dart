import "package:flutter/material.dart";

import '../../data/local/shared_preference/use_case.dart';
import '../constants/theme.dart';
import 'home_page/home_page.dart';
import 'login_page/login_page.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> loggedIn = getPrefLoggedIn();
    
    return FutureBuilder(
      future: loggedIn,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        bool userLogIn = snapshot.hasData ? snapshot.data : false;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: normalThemeData,
          darkTheme: darkThemeData,
          home: userLogIn ? HomePage() : LoginPage(),
        );
      }
    );
  }
}
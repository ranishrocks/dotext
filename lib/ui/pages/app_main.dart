import "package:flutter/material.dart";

import 'home_page/home_page.dart';
import 'login_page/login_page.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool loggedIn = getIfLoggedIn();
    
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData,
      // darkTheme: ThemeData,
      themeMode: ThemeMode.system,
      home: loggedIn ? HomePage() : LoginPage(),
    );
  }
}

getIfLoggedIn(){
  return true;
}
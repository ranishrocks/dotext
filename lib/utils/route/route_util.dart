import 'package:flutter/material.dart';

class RouteUtil {
  void pushNamed(BuildContext context, String routeName, [Object? arguments]){
    try {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    } catch (e) {
      print(e);
    }
  }

  void pushReplace(BuildContext context, String routeName){
    try {
      Navigator.pushReplacementNamed(context, routeName);
    } catch (e) {
      print(e);
    }
  }

  void pop(BuildContext context){
    try {
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
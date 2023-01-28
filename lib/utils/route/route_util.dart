import 'package:flutter/material.dart';

class RouteUtil {
  pushNamed(BuildContext context, String routeName, [Object? arguments]){
    try {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    } catch (e) {
      print(e);
    }
    
  }

  pop(BuildContext context){
    try {
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
    
  }
}
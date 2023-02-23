import 'package:flutter/material.dart';

class RouteUtil {
  void push(BuildContext context, Widget widget){
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
      );
    } catch (e) {
      print(e);
    }
  }

  void pushReplace(BuildContext context, Widget widget){
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
      );
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
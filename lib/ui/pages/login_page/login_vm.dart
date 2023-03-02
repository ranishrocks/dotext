import 'package:dot_connect_flutter/ui/pages/home_page/home_page.dart';
import 'package:dot_connect_flutter/ui/pages/home_page/home_page_detail.dart';
import 'package:dot_connect_flutter/utils/route/route_util.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/local/shared_preference/use_case.dart';

class LoginViewModel{
  Future<bool> logIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      print('googleUser : ${googleUser ?? "no google user"}');

      if(googleUser != null) {
        print('name = ${googleUser.displayName}');
        print('email = ${googleUser.email}');
        print('id = ${googleUser.id}');

        setPrefLoggedIn(true);
        RouteUtil().pushReplace(context, HomePage());
        return true;

      } else {
        setPrefLoggedIn(false);
        return false;
      }

    } catch (e) {
      print("Error while login google : $e");
      return false;
    }
  }
}
import 'package:dot_connect_flutter/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

import '../../../data/local/shared_preference/use_case.dart';

class LoginViewModel{
  logIn(BuildContext context){
    setPrefLoggedIn(true);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  logOut(){
    setPrefLoggedIn(false);
  }
}
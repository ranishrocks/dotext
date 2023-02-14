import 'package:dot_connect_flutter/ui/pages/home_page/home_page.dart';
import 'package:dot_connect_flutter/utils/route/route_paths.dart';
import 'package:dot_connect_flutter/utils/route/route_util.dart';
import 'package:flutter/material.dart';

import '../../../data/local/shared_preference/use_case.dart';

class LoginViewModel{
  logIn(BuildContext context){
    setPrefLoggedIn(true);
    RouteUtil().pushReplace(context, RouteNames.home.path);
  }
}
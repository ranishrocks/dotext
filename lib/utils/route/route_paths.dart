import 'package:flutter/material.dart';

import '../../ui/pages/home_page/home_page.dart';
import '../../ui/pages/login_page/login_page.dart';
import '../../ui/pages/report_page/report_page.dart';
import '../../ui/pages/search_page/search_page.dart';
import '../../ui/pages/translate_cam_page/translate_cam_page.dart';

//Stores screen route names. e.g.) RouteNames.home.path
enum RouteNames {
  home('/home'),
  login('/login'),
  transCam('/transCam'),
  search('/search'),
  report('/report');
  
  const RouteNames(this.path);    
  final String path;
}

Map<String, Widget Function(BuildContext)> mainRoutes = {
  RouteNames.home.path: (context) => HomePage(),
  RouteNames.login.path: (context) => LoginPage(),
  RouteNames.transCam.path: (context) => TranslateCamPage(),
  RouteNames.search.path: (context) => SearchPage(),
  RouteNames.report.path: (context) => ReportPage(),
};
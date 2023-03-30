import 'package:dot_connect_flutter/ui/pages/home_page/home_page.dart';
import 'package:dot_connect_flutter/ui/pages/home_page/home_page_detail.dart';
import 'package:dot_connect_flutter/ui/pages/login_page/login_page.dart';
import 'package:dot_connect_flutter/ui/pages/report_page/report_page.dart';
import 'package:dot_connect_flutter/ui/pages/translate_cam_page/translate_cam_page.dart';
import 'package:dot_connect_flutter/ui/states/view_mode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/local/shared_preference/use_case.dart';
import '../../../utils/route/route_util.dart';
import '../search_page/search_simple/search_page.dart';

class HomeViewModel {
  void logOut(BuildContext context, WidgetRef ref,) async {
    try {
      await GoogleSignIn().signOut();

      //reset states
      setPrefLoggedIn(false);
      ref.read(ModeProvider.notifier).state = ViewMode.simple;

      //go to logout screen
      RouteUtil().pushReplace(context, LoginPage());

    } catch (e) {
      print("Error while logout google : $e");
    }
  }
  void changeMode(BuildContext context, WidgetRef ref, ViewMode viewMode) {
    if(viewMode == ViewMode.detail){
      RouteUtil().pushReplace(context, HomePageDetail());
      ref.read(ModeProvider.notifier).state = ViewMode.detail;


    } else if(viewMode == ViewMode.simple){
      RouteUtil().pushReplace(context, HomePage());
      ref.read(ModeProvider.notifier).state = ViewMode.simple;
    }
  }

  //routings
  void routeToTransCam(BuildContext context){
    RouteUtil().push(context, TranslateCamPage());
  }
  void routeToSearch(BuildContext context){
    RouteUtil().push(context, SearchPage());
  }
  void routeToReport(BuildContext context){
    RouteUtil().push(context, ReportPage());
  }
}
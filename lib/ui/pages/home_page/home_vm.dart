import 'package:dot_connect_flutter/ui/pages/login_page/login_page.dart';
import 'package:dot_connect_flutter/ui/pages/report_page/report_page.dart';
import 'package:dot_connect_flutter/ui/pages/search_page/search_page.dart';
import 'package:dot_connect_flutter/ui/pages/translate_cam_page/translate_cam_page.dart';
import 'package:dot_connect_flutter/ui/states/view_mode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/local/shared_preference/use_case.dart';
import '../../../utils/route/route_util.dart';

class HomeViewModel {
  logOut(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();

      setPrefLoggedIn(false);
      RouteUtil().pushReplace(context, LoginPage());
    } catch (e) {
      print("Error while logout google : $e");
    }
  }
  changeMode(WidgetRef ref) {
    ref.read(ModeProvider.notifier).state = ViewMode.detail;
  }

  //routings
  routeToTransCam(BuildContext context){
    RouteUtil().push(context, TranslateCamPage());
  }
  routeToSearch(BuildContext context){
    RouteUtil().push(context, SearchPage());
  }
  routeToReport(BuildContext context){
    RouteUtil().push(context, ReportPage());
  }
}
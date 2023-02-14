import 'package:dot_connect_flutter/ui/states/view_mode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/shared_preference/use_case.dart';
import '../../../utils/route/route_paths.dart';
import '../../../utils/route/route_util.dart';

class HomeViewModel {
  logOut(BuildContext context){
    setPrefLoggedIn(false);
    RouteUtil().pushReplace(context, RouteNames.login.path);
  }
  changeMode(WidgetRef ref) {
    ref.read(ModeProvider.notifier).state = ViewMode.detail;
  }

  //routings
  routeToTransCam(BuildContext context){
    RouteUtil().pushNamed(context, RouteNames.transCam.path);
  }
  routeToSearch(BuildContext context){
    RouteUtil().pushNamed(context, RouteNames.search.path);
  }
  routeToReport(BuildContext context){
    RouteUtil().pushNamed(context, RouteNames.report.path);
  }
}
import 'package:dot_connect_flutter/utils/route/route_util.dart';
import 'package:flutter/material.dart';

import '../braille_detail_page/braille_detail_page.dart';

class BrailleInfoListViewModel {
  routeToBrailleDetail(BuildContext context, String text, String braille, [String? wholeText]){
    var appbarText = (wholeText!=null) ? "return to $wholeText" : "return";
    RouteUtil().push(
      context,
      BrailleDetailPage(
        appbarText: appbarText,
        text:text,
        braille:braille
      )
    );
  }
}
import 'package:dot_connect_flutter/ui/pages/braille_info_list_page/braille_info_list_page.dart';
import 'package:dot_connect_flutter/utils/route/route_util.dart';
import 'package:flutter/material.dart';

import '../../../entities/braille_info_page_entity.dart';

class TranslateCamViewModel {
  translate(BuildContext context, String braille) {
    RouteUtil().push(context, BrailleInfoListPage(textToBrailleList: [
      TextBraillePair(text: "녕", braille: String.fromCharCodes([0x2823, 0x282B])),
      TextBraillePair(text: "안", braille: String.fromCharCodes([0x280E, 0x2816])),
    ]));
  }
}
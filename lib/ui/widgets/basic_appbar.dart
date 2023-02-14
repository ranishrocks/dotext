import 'package:flutter/material.dart';

import '../../utils/route/route_util.dart';
import 'text_sized/text_small.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  BasicAppbar({super.key, this.appbarString}): preferredSize = Size.fromHeight(kToolbarHeight);

  final String? appbarString;

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          RouteUtil().pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Color(0xFF000000),
        ),
      ),
      title: Text_S(text: appbarString ?? ""),
    );
  }
}
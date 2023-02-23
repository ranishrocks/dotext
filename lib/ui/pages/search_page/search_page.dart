import 'package:dot_connect_flutter/ui/widgets/text_sized/text_medium.dart';
import 'package:flutter/material.dart';

import '../../constants/fixed_data.dart';
import '../../widgets/main_appbar.dart';
import 'search_body.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MainAppbar(appbarString: "return to main"),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchTitle(),
          SearchBody(),
        ],
      ),
    );
  }
}

class SearchTitle extends StatelessWidget {
  SearchTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.fromLTRB(pageHozPadding, 0, pageHozPadding, 0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text_M(text: "Search"),
            SizedBox(height: 56,),
          ],
        ),
      )
    );
  }
}
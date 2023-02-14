import 'package:dot_connect_flutter/ui/widgets/text_sized/text_medium.dart';
import 'package:flutter/material.dart';

import '../../widgets/basic_appbar.dart';
import 'search_box.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(appbarString: "return to main",),
      body: Column(
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
    return Text_M(text: "Search");
  }
}
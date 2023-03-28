import 'package:dot_connect_flutter/ui/widgets/text_sized/text_medium.dart';
import 'package:dot_connect_flutter/ui/widgets/text_sized/text_xlarge.dart';
import 'package:flutter/material.dart';

import '../../constants/fixed_data.dart';
import '../../widgets/main_appbar.dart';

class BrailleDetailPage extends StatelessWidget {
  BrailleDetailPage({
    super.key,
    required this.text,
    required this.braille,
    this.appbarText
  });

  final String? appbarText;
  final String text;
  final String braille;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(appbarString: appbarText),
      body: Stack(
        children: [
          Positioned(
            top: 35,
            left: pageHozPadding,
            child: Text_M(text: text),
          ),
          Center(
            child: SafeArea(
              child: Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(pageHozPadding, 5, pageHozPadding, 5),
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(braille),
                  ),
                ),
              )
            )
          ),
        ],
      )
    );
  }
}
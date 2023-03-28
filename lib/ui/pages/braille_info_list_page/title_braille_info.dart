import 'package:dot_connect_flutter/ui/widgets/text_sized/text_xlarge.dart';
import 'package:flutter/material.dart';

class TitleBrailleInfo extends StatelessWidget {
  TitleBrailleInfo(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 48, 0, 48),
      color: Color(0xFFF9F9F9),
      child: Text_XL(text: title)
    );
  }
}
import 'package:flutter/material.dart';

import 'text_with_margin.dart';

class Text_M extends StatelessWidget {
  Text_M({
    super.key,
    required this.text,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
  });

  final String text;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    TextStyle textMediumStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Color(0xFF020202)
    );

    return TextWithMargin(
      text: text,
      textStyle: textMediumStyle,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
    );
  }
}
import 'package:flutter/material.dart';

import 'text_with_margin.dart';

class Text_L extends StatelessWidget {
  Text_L({
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
    TextStyle textLargeStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w500,
      color: Color(0xFF222222)
    );

    return TextWithMargin(
      text: text,
      textStyle: textLargeStyle,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
    );
  }
}
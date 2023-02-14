import 'package:flutter/material.dart';

import 'text_with_margin.dart';

class Text_S extends StatelessWidget {
  Text_S({
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
    TextStyle textSmallStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color(0xFF222222)
    );

    return TextWithMargin(
      text: text,
      textStyle: textSmallStyle,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
    );
  }
}
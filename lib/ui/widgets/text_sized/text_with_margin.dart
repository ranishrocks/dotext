import 'package:flutter/material.dart';

class TextWithMargin extends StatelessWidget {
  TextWithMargin({
    super.key,
    required this.text,
    this.textStyle,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
  });

  final String text;
  final TextStyle? textStyle;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    TextStyle? textCustomStyle = textStyle;

    double topMargin = marginTop ?? 0;
    double bottomMargin = marginBottom ?? 0;
    double leftMargin = marginLeft ?? 0;
    double rightMargin = marginRight ?? 0;

    bool marginExist = (topMargin!=0) || (bottomMargin!=0) || (leftMargin!=0) || (rightMargin!=0);

    if(marginExist){
      return Container(
        margin: EdgeInsets.fromLTRB(leftMargin, topMargin, rightMargin, bottomMargin),
        child: Text(text, style: textCustomStyle, overflow: TextOverflow.visible),
      );

    } else {
      return Text(text, style: textCustomStyle, overflow: TextOverflow.visible);
    }
  }
}
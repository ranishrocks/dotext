import "package:flutter/material.dart";

class TitleText_L extends StatelessWidget {
  TitleText_L({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
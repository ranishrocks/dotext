import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({super.key, this.width, this.height, this.marginTop, this.marginBottom});
  final double? width;
  final double? height;
  final double? marginTop;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: marginTop,),
        Image.asset(
          "assets/img/logo.png",
          width: width,
          height: height,
        ),
        SizedBox(height: marginTop,),
      ],
    );
  }
}
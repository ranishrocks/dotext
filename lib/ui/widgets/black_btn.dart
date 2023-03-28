import 'package:flutter/material.dart';

class BlackBtn extends StatelessWidget {
  BlackBtn({super.key, this.text, this.tapAction});

  final String? text;
  final Function()? tapAction;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var buttonWidth = screenSize.width - (16*2);
    var buttonTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white
    );

    return SizedBox(
      width: buttonWidth,
      child: OutlinedButton(
        onPressed: () {
          tapAction!();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(8, 16, 8, 16)),
        ),
        child: Text(
          text ?? "",
          style: buttonTextStyle,
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/fixed_data.dart';
import '../../widgets/logo_widget.dart';
import 'google_login_btn.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  String inputText = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Logo(width: size.width * (0.6), marginTop: 25,),
            LoginButton()
          ],
        ),
      ),
    );
  }
}


class LoginButton extends StatelessWidget {
  LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - (pageHozPadding*2),
      height: 40,
      child: GoogleLoginBtn()
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/logo_widget.dart';
import 'google_login_btn.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  String inputText = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Logo(
              width: size.width * (0.8),
              // marginTop: size.height * (0.1),
              // marginBottom: 40,
            ),
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
    return GoogleLoginBtn();
  }
}
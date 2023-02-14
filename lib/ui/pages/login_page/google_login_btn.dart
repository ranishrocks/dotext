import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'login_vm.dart';

class GoogleLoginBtn extends StatelessWidget {
  GoogleLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = LoginViewModel();
    
    return SignInButton(
      Buttons.Google,
      onPressed: () {
        viewModel.logIn(context);
      },
    );
  }
}
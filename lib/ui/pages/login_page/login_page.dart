import 'package:dot_connect_flutter/ui/pages/login_page/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/name_state.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  String inputText = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myName = ref.watch(NameProvider);
    var viewModel = LoginViewModel();

    return Scaffold(
      appBar: AppBar(title: Text("LoginPage")),
      body: Column(
        children: [
          Text("name state in login : $myName"),
          TextField(
              decoration: InputDecoration(labelText: 'Input Name'),
              onChanged: (text) {
                inputText = text;
              },
            ),
            GestureDetector(
              onTap: () {
                ref.read(NameProvider.notifier).state = inputText;
              },
              child: Text(
                "Done",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                viewModel.logIn(context);
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            GestureDetector(
              onTap: () {
                viewModel.logOut();
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
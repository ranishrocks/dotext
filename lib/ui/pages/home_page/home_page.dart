import 'package:dot_connect_flutter/ui/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/name_state.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  String inputText = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myName = ref.watch(NameProvider);

    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("name state in home : $myName"),
            SizedBox(height: 15,),
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
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "GO TO LOGIN",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:dot_connect_flutter/data/remote/network.dart';
import 'package:dot_connect_flutter/data/remote/network_data/response/response_data.dart';
import 'package:dot_connect_flutter/ui/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/name_state.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  String inputText = "";
  String networkData = "UNDEFINED";

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
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Network().getNameAPI() as NameAPIResponse;
              },
              child: Text(
                "GET DATA FROM NETWORK",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
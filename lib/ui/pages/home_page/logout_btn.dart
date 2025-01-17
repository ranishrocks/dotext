import 'package:dot_connect_flutter/ui/pages/home_page/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/text_sized/text_small.dart';

class LogoutBtn extends ConsumerWidget {
  LogoutBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = HomeViewModel();

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: GestureDetector(
        onTap: () {
          viewModel.logOut(context, ref);
        },
        child: Text_S(text: "Logout"),
      ),
    );
  }
}
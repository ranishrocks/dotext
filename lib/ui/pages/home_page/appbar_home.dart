import 'package:dot_connect_flutter/ui/pages/home_page/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/logo_widget.dart';
import '../../widgets/text_sized/text_small.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppbar({super.key}) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Logo(width: 68, height: 18),
      actions: [
        ModeSetBtn()
      ],
    );
  }
}

class ModeSetBtn extends ConsumerWidget {
  ModeSetBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = HomeViewModel();

    return Center(
      child: GestureDetector(
        onTap: () {
          viewModel.changeMode(ref);
        },
        child: Text_S(text: "mode select"),
      ),
    );
  }
}
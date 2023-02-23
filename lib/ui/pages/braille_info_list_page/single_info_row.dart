import 'package:dot_connect_flutter/ui/widgets/text_sized/text_large.dart';
import 'package:dot_connect_flutter/ui/widgets/text_sized/text_medium.dart';
import 'package:flutter/material.dart';

import 'braill_info_list_vm.dart';

class SingleInfoRow extends StatelessWidget {
  SingleInfoRow({super.key, required this.text, required this.braille, this.wholeText});

  final String text;
  final String braille;
  final String? wholeText;

  @override
  Widget build(BuildContext context) {
    var vm = BrailleInfoListViewModel();
    
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 25, 20),
      child: GestureDetector(
        onTap: () {
          vm.routeToBrailleDetail(context, text, braille, wholeText);
        },
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _RowInfo(text, braille),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

class _RowInfo extends StatelessWidget {
  _RowInfo(this.text, this.braille, {super.key});

  final String text;
  final String braille;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text_M(text: text),
        SizedBox(width: 24,),
        Text_L(text: braille),
      ],
    );
  }
}
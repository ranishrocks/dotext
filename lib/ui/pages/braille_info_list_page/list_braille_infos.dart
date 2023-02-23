import 'package:flutter/material.dart';

import '../../../entities/braille_info_page_entity.dart';
import 'single_info_row.dart';

class ListBrailleInfo extends StatelessWidget {
  ListBrailleInfo(this.textMapBrailleList, {super.key});

  final List<TextBraillePair> textMapBrailleList;

  @override
  Widget build(BuildContext context) {
    String wholeText = textMapBrailleList.fold("", (previousValue, element) => previousValue+element.text);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: textMapBrailleList.length,
      itemBuilder: (context, index) {
        return SingleInfoRow(
          text: textMapBrailleList[index].text,
          braille: textMapBrailleList[index].braille,
          wholeText: wholeText,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}


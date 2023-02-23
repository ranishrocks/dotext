import 'package:dot_connect_flutter/ui/widgets/main_appbar.dart';
import 'package:flutter/material.dart';

import '../../../entities/braille_info_page_entity.dart';
import 'list_braille_infos.dart';
import 'title_braille_info.dart';

class BrailleInfoListPage extends StatelessWidget {
  BrailleInfoListPage({
    super.key,
    this.appbarText,
    required this.textToBrailleList,
    this.titleType
  });

  final String? appbarText;
  final List<TextBraillePair> textToBrailleList;
  final TitleType? titleType;

  @override
  Widget build(BuildContext context) {
    String textString = textToBrailleList.fold("", (previousValue, element){
      return previousValue + element.text;
    });
    String brailleString = textToBrailleList.fold("", (previousValue, element){
      return previousValue + element.braille;
    });
    
    String titleText = (titleType==TitleType.braille) ? brailleString : textString;
    
    return Scaffold(
      appBar: MainAppbar(appbarString: appbarText),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBrailleInfo(titleText),
            ListBrailleInfo(textToBrailleList),
          ],
        ),
      ),
    );
  }
}
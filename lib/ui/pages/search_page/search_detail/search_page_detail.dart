import 'package:dot_connect_flutter/entities/braille_info_page_entity.dart';
import 'package:dot_connect_flutter/ui/pages/braille_info_list_page/braille_info_list_page.dart';
import 'package:flutter/material.dart';

import '../../braille_info_list_page/list_braille_infos.dart';
import '../../braille_info_list_page/title_braille_info.dart';
import 'search_detail_input.dart';

class SearchPageDetail extends StatefulWidget {
  const SearchPageDetail({super.key});

  @override
  State<SearchPageDetail> createState() => SearchPageDetailState();
}

class SearchPageDetailState extends State<SearchPageDetail> {

  bool inputFocused = false;
  List<TextBraillePair> searchResult = [];

  @override
  Widget build(BuildContext context) {
    String brailleString = searchResult.fold("", (previousValue, element){
      return previousValue + element.braille;
    });

    return Scaffold(
      body: Column(
        children: [
          SearchInputBox(
            setFocused: (bool focused){
              setState(() {
                inputFocused = focused;
              });
            },
            setResult: (List<TextBraillePair> result){
              setState(() {
                searchResult = result;
              });
            }
          ),
          (searchResult.isNotEmpty && !inputFocused)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  TitleBrailleInfo(brailleString),
                  ListBrailleInfo(searchResult),
                ],
              ),
            )
          : Container()
        ]
      ),
    );
  }
}
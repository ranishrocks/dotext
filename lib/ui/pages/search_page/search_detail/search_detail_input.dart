import 'package:flutter/material.dart';

import '../../../../data/remote/use_case/search_api_use_case.dart';
import '../../../../entities/braille_info_page_entity.dart';

class SearchInputBox extends StatefulWidget {
  const SearchInputBox({super.key, required this.setFocused, required this.setResult});

  final ValueSetter<bool> setFocused;
  final ValueSetter<List<TextBraillePair>> setResult;

  @override
  State<SearchInputBox> createState() => SearchInputBoxState();
}

class SearchInputBoxState extends State<SearchInputBox> {

  final inputController = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      widget.setFocused(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return SizedBox(
      width: size.width - (10*2),
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x27222222), width:0.5),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x27222222), width:0.5),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x27222222), width:0.5),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          fillColor: Color(0xFFF4F4F4),
          suffixIcon: IconButton(
            onPressed: () {
              inputController.clear();
              _focusNode.unfocus();
              widget.setResult([]);
            },
            color: Color(0xFF757575),
            icon: Icon(Icons.cancel),
          ),
        ),
        controller: inputController,
        focusNode: _focusNode,
        textInputAction: TextInputAction.go,
        onSubmitted: (value) async {
          var result = await SearchApiUseCase().searchKeyword(inputController.text);
          if(result.runtimeType == List<TextBraillePair>){
            widget.setResult(result);
          }
        },
  ),
    );
  }
}
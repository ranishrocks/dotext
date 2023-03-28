import 'package:dot_connect_flutter/ui/pages/search_page/search_vm.dart';
import 'package:dot_connect_flutter/ui/widgets/black_btn.dart';
import 'package:flutter/material.dart';

import '../../constants/fixed_data.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => SearchBodyState();
}

class SearchBodyState extends State<SearchBody> {

  final textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchBox(inputController: textInputController),
          SearchBtn(inputController: textInputController),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(pageHozPadding, 0, pageHozPadding, 0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Input",
              ),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
              controller: inputController,
            ),
          ),
          Icon(
            Icons.search,
            size: 35,
            color: Color(0x4D222222),
          ),
        ],
      ),
    );
  }
}

class SearchBtn extends StatelessWidget {
  SearchBtn({super.key, required this.inputController});
  
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    var viewModel = SearchViewModel();
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        BlackBtn(
          text: "search",
          tapAction: () {
            viewModel.search(inputController.text, context);
          },
        ),
        SizedBox(height: bottomBtnFromBellow,)
      ],
    );
  }
}
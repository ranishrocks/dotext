import 'package:dot_connect_flutter/ui/pages/search_page/search_vm.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => SearchBodyState();
}

class SearchBodyState extends State<SearchBody> {

  final textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(inputController: textInputController),
        SearchBtn(keyword: textInputController.text),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              label: Text("Input"),
            ),
            controller: inputController,
          ),
        ),
        Icon(
          Icons.search,
          size: 30,
          color: Color(0x4D222222),
        ),
      ],
    );
  }
}

class SearchBtn extends StatelessWidget {
  SearchBtn({super.key, required this.keyword});
  
  final String keyword;

  @override
  Widget build(BuildContext context) {
    var viewModel = SearchViewModel();
    return GestureDetector(
      onTap: () {
        viewModel.search(keyword);
      },
    );
  }
}
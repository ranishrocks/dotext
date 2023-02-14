import 'package:flutter/material.dart';

import '../../widgets/text_sized/text_large.dart';
import 'home_vm.dart';

class OptionList extends StatelessWidget {
  OptionList({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = HomeViewModel();
    
    return ListView(
      shrinkWrap: true,
      children: [
        SingleOption(
          title: "transCam",
          onPress: (){
            viewModel.routeToTransCam(context);
          },
        ),
        SingleOption(
          title: "search",
          onPress: (){
            viewModel.routeToSearch(context);
          },
        ),
        SingleOption(
          title: "report",
          onPress: (){
            viewModel.routeToReport(context);
          },
        ),
      ],
    );
  }
}

class SingleOption extends StatelessWidget {
  SingleOption({super.key, required this.title, required this.onPress});
  
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x26222222), width:1,)
        )
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onPress();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,20,0,20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text_L(text: title, marginLeft: 15),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0x4D222222),
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
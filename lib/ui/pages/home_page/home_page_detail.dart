import 'package:flutter/material.dart';

import '../report_page/report_page.dart';
import '../search_page/search_page.dart';
import '../translate_cam_page/translate_cam_page.dart';
import 'appbar_home.dart';

class HomePageDetail extends StatefulWidget {
  const HomePageDetail({super.key});

  @override
  State<HomePageDetail> createState() => HomePageDetailState();
}

class HomePageDetailState extends State<HomePageDetail> {

  int _selectedIndex = 0; // 선택된 페이지의 인덱스 넘버 초기화
  
  void onItemTapped(int index) { // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    TranslateCamPage(showBackBtn: false,),
    SearchPage(appbar: false),
    ReportPage(appbar: false, isDetail: true),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: HomeAppbar(isDetailMode: true,),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      // bottom navigation 선언
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.drag_indicator),
            label: '번역',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem),
            label: '신고',
          ),
        ],
        currentIndex: _selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.black,
        onTap: onItemTapped, // 선언했던 onItemTapped
      ),
    );
  }
}
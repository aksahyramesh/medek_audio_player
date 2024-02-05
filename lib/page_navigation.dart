import 'package:flutter/material.dart';


import 'package:medak/navigationbar/bottomnavigationbar.dart';

import 'package:medak/pages/homePage.dart';

import 'package:medak/pages/music_liberey.dart';
import 'package:medak/pages/searchPage.dart';




class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  


  var pages = [
    OnlinePlay(),
    Srhpage(),
    Library(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        bottomNavigationBar: bottomnavigationbar(),
        body: ValueListenableBuilder(
          valueListenable: pageindex,
          builder: (context, value, child) {
            return pages[pageindex.value];
          },
        ));
  }
}

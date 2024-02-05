import 'package:flutter/material.dart';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

final PageController _pageController = PageController(initialPage: 0);
ValueNotifier<int> pageindex = ValueNotifier<int>(2);

ValueListenableBuilder<int> bottomnavigationbar() {
  return ValueListenableBuilder<int>(
    valueListenable: pageindex,
    builder: (context, value, child) {
      return CrystalNavigationBar(
          currentIndex: value,
          height: 10,
          indicatorColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.greenAccent,
          backgroundColor: Colors.black,
          onTap: (indexe) {
            pageindex.value = indexe;
          },
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: Icons.home_outlined,
            ),
            CrystalNavigationBarItem(icon: Icons.search),
            // CrystalNavigationBarItem(
            //   icon: Icons.play_arrow,
            // ),
            CrystalNavigationBarItem(
              icon: Icons.library_music_outlined,
            ),
          ]);
    },
  );
}

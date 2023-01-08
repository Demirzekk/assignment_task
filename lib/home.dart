import '../utility/constants/app_icons.dart';
import 'package:flutter/material.dart';

import 'base/base_widgets.dart';
import 'pages/home_page/home_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({
    super.key,
  });

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with BaseWidgets, AppIconPacks {
  int currentIndex = 0;
  late var tabScreens = [];

  @override
  void initState() {
    tabScreens = [HomePage(), HomePage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assignment Task',
        home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey.shade800,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            bottomNavigationBarItem(
              context,
              label: "Anasayfa",
              icon: homeIcon,
              activeIcon: homeIcon,
              color: Colors.grey.shade800,
              activeColor: Theme.of(context).primaryColor,
            ),
            bottomNavigationBarItem(
              context,
              label: " ",
              icon: ringIcon,
              activeIcon: ringIcon,
              color: Colors.grey.shade800,
              activeColor: Theme.of(context).primaryColor,
            ),
          ],
        )));
  }
}

import 'package:assignment_task/utility/constants/app_icons.dart';
import 'package:flutter/material.dart';

import 'utility/base_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
    
      home:  MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,  });
 
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AppIconPacks{
   int currentIndex = 0;
 late var tabScreens =[];
@override
  void initState() {
 tabScreens = [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(  bottomNavigationBar: BottomNavigationBar(
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
                activeIcon:  homeIcon,
                color: Colors.grey.shade800,
                activeColor: Theme.of(context).primaryColor,
              ),
              bottomNavigationBarItem(
                context,
                label: "Lobby",
                icon:  lobbyIcon,
                activeIcon:  lobbyIcon,
                color: Colors.grey.shade800,
                activeColor: Theme.of(context).primaryColor,
              ),
          
            ]));
  }

    BottomNavigationBarItem bottomNavigationBarItem(BuildContext context,
      {required String label,
      required String icon,
      required String activeIcon,
      required Color activeColor,
      required Color color,
      double width = 20.0,
      height = 20.0}) {
    return BottomNavigationBarItem(
        label: label,
        activeIcon: SvgIconFromAssets(
            iconName: activeIcon,
            color: Theme.of(context).primaryColor,
            width: width,
            height: height),
        icon: SvgIconFromAssets(
            color: color, iconName: icon, width: width, height: height));
  }
}

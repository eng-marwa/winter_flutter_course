import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<NavigationBarItem> items = [
    NavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    NavigationBarItem(
        label: 'Notifications',
        icon: Badge(
          textColor: Colors.white,
          backgroundColor: Colors.red,
          label: Text('5'),
          child: Icon(Icons.notifications),
        )),
    NavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
  ];

  final List<Color> pagesColor = [Colors.red, Colors.green, Colors.blue];

  int _selectItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pagesColor[_selectItemIndex],
        body: Container(color: pagesColor[_selectItemIndex]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.transparent,
              iconSize: 30,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: _selectItemIndex,
              onTap: (index) {
                setState(() {
                  _selectItemIndex = index;
                });
              },
              items: items
                  .map(
                    (e) =>
                        BottomNavigationBarItem(icon: e.icon, label: e.label),
                  )
                  .toList()),
        ));
  }
}

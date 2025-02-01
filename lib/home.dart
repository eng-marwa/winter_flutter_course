import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
        onPageChanged: (index) {
          _pageIndex = index;
          debugPrint('Page changed to index $index');
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_pageIndex == 0) {
                _pageController.animateToPage(2,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                _pageController.animateToPage(--_pageIndex,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }
            },
            child: Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
              onPressed: () {
                if (_pageIndex == 2) {
                  _pageController.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  _pageController.animateToPage(++_pageIndex,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
              child: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}

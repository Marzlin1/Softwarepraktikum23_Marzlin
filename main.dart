import 'package:bottom_navy_bar/bottom_navy_bar.dart'; //bei pubspec.yaml folgendes aus dem internet kopieren --> https://pub.dev/packages/bottom_navy_bar/install
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("PH Maps")),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hallo"),
                      SizedBox(height: 16),
                      Text("Hi"),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hier klappts auch"),
                      SizedBox(height: 16),
                      Text("Juhu!"),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(title: Text("Menü"), icon: Icon(Icons.home)),
              BottomNavyBarItem(
                  title: Text("Navigation"),
                  icon: Icon(Icons.assistant_direction,
                      color: Color.fromARGB(255, 140, 208, 0))),
              BottomNavyBarItem(
                  title: Text("Pläne"), icon: Icon(Icons.map_outlined)),
              BottomNavyBarItem(
                  title: Text("Gespeichert"),
                  icon: Icon(Icons.bookmarks_outlined)),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _currentIndex = 0;
  final _body = [const Tab1(), const Tab2(), const Tab3()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          // if you not provide current index then bottomNavigation Bar not work
          currentIndex: _currentIndex,
          elevation: 50,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.green,
          iconSize: 40,
          selectedFontSize: 25,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            // icon and label must to display
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "people"),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "save"),
          ], //items
        ), //navigationbar
        appBar: AppBar(
          title: const Text("BottomNAvigation Bar"),
        ), //appbar
        body: _body[_currentIndex],
      ), //scaffold
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow);
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}

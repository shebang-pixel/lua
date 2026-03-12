import 'package:flutter/material.dart';
import 'pg1.dart';
import 'pg2.dart';
import 'pg3.dart';
import 'pg4.dart';



class BinderPage extends StatefulWidget {
  const BinderPage({super.key});

  @override
  _BinderPageState createState() => _BinderPageState();
}

class _BinderPageState extends State<BinderPage> {
  int _initial = 0;

  final List<Widget> _pages = <Widget>[
    HomePage(),
    WeatherPage(),
    Diaries(),
    LibraryScreen(),
  ];

  _onIconTap(int index) {
    setState(() {
      _initial = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   title: Text('Binder Page'),
      // ),
      body: Center(
        child: _pages.elementAt(_initial),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.cloud),label: 'Weather'),
            BottomNavigationBarItem(icon: Icon(Icons.notes),label: 'Diaries'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books),label: 'Library'),
          ],
        currentIndex: _initial,
        onTap: _onIconTap,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,

      ),
    );
  }

}
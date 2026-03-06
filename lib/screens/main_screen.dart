import 'package:flutter/material.dart';
import 'package:lua/screens/weather_page.dart';
import '../screens/home_page.dart';
import '../screens/jokes_page.dart';
import '../screens/quotes_page.dart';
import '../screens/facts_page.dart';
import '../screens/pictures_page.dart';

class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _initial_index = 0;

  _onIconTap(int index) {
    setState(() {
      _initial_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _initial_index,
        children: [
          HomeScreen(),
          WeatherPage(),
          JokesPage(),
          QuotesPage(),
          FactsPage(),
          PicturesPage(),
        ],
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_mini_rounded,color: Colors.black87,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny_snowing,color: Colors.black87,),label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.point_of_sale,color: Colors.black87,),label: 'Jokes'),
          BottomNavigationBarItem(icon: Icon(Icons.format_quote_rounded,color: Colors.black87,),label: 'Quotes'),
          BottomNavigationBarItem(icon: Icon(Icons.fact_check,color: Colors.black87,),label: 'Facts'),
          BottomNavigationBarItem(icon: Icon(Icons.picture_in_picture,color: Colors.black87,),label: 'Pictures')
        ],
        currentIndex: _initial_index,
        selectedItemColor: Colors.red,
        onTap: _onIconTap,
      ),
    );
  }
}
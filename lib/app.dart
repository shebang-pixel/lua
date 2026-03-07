import 'package:flutter/material.dart';
import '../screens/main_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Colors.teal,
        
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(1, 15, 140, 212)
        ),

        scaffoldBackgroundColor: Color.fromARGB(100, 54, 117, 180),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(100, 170, 215, 5),
          foregroundColor: Colors.black,
        ),

      ),

      darkTheme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(206, 169, 215, 5),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),

      ),

      themeMode: ThemeMode.system,
      home: MainScreen(),//
    );
  }
}
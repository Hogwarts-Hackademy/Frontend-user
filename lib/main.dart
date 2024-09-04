import 'package:flutter/material.dart';
import 'screens/IntroScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue   ,
      ),
      home: const IntroScreen(),
    );  
  }
}

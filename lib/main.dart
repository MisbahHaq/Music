import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music/home.dart';
import 'package:music/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

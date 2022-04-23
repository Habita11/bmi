import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

import 'home.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}
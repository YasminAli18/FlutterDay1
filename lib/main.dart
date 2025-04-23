import 'package:flutter/material.dart';
// import 'Screen3.dart';
// import 'Screen2.dart';
import 'screen1.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home:  CustomPage(), 
      // home:  TaskScreen(), 
      home:  WelcomeScreen(), 
    );
  }
}
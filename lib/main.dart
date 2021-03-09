import 'package:flutter/material.dart';
import './theme.dart';
import './home_screen.dart';
import './LoginScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wibi',
      theme: theme(),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

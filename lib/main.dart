//import 'package:WIBI/login/LoginScreen.dart';
//import 'package:WIBI/details/details_screen.dart';
//import 'package:WIBI/credentials/UserCredentials.dart';
//import 'package:WIBI/details/product_screen.dart';
import 'package:WIBI/home/home_screen.dart';
import 'package:WIBI/login/LoginScreen.dart';
//import 'package:WIBI/login/invalid_login.dart';
//import 'package:WIBI/routes.dart';
import 'package:flutter/material.dart';
import './theme.dart';
//import './home_screen.dart';
//import './LoginScreen.dart';
import 'splash/splash_screen.dart';
//import 'login/LoginScreen.dart';

void main() {
  runApp(MyApp()
      /* MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ), */
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wibi',
      theme: theme(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        //'/product': (context) => ProductScreen(),
      },
    );
  }
}

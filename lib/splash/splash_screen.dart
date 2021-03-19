import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/splash/components/body.dart';
import 'package:flutter/material.dart';
//import 'package:WIBI/screens/splash/components/body.dart';
//import 'package:WIBI/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

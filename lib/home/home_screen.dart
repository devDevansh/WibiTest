//import 'package:WIBI/components/body.dart';
import 'package:WIBI/components/coustom_bottom_nav_bar.dart';
import 'package:WIBI/components/enums.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/home/body.dart';
import 'package:flutter/material.dart';
/* import './components/coustom_bottom_nav_bar.dart';
import './components/enums.dart';
import './components/size_config.dart';
import 'components/body.dart'; */

class HomeScreen extends StatelessWidget {
  //static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

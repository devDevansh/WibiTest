//import 'package:WIBI/admin/admin_screen.dart';
import 'package:WIBI/login/invalid_login.dart';
import 'package:WIBI/profile/profile_screen.dart';
import 'package:WIBI/sell/sellproduct.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import '../catelements.dart';
//import '../dummy.dart';
import './enums.dart';
//import '../LoginScreen.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 13, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFF1264D1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 10.0,
            offset: Offset(0.0, -4.0),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(63),
          topRight: Radius.circular(63),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: Colors.white,
                      width: 28.5,
                      height: 28.5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => Hello(),
                        ),
                      );
                    },
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/sell.svg",
                      color: Colors.white,
                      width: 34,
                      height: 34,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => SellPage(),
                        ),
                      );
                    },
                  ),
                  Text(
                    "Sell",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/chat.svg",
                      color: Colors.white,
                      width: 28.5,
                      height: 28.5,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Slack",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              child: Column(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      color: Colors.white,
                      width: 28.5,
                      height: 28.5,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

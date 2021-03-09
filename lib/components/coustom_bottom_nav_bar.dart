import 'package:WIBI/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../catelements.dart';
import '../dummy.dart';
import './enums.dart';
//import '../LoginScreen.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  final GoogleSignIn _gSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
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
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
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
                      _gSignIn.signOut();
                      print('Signed out');
                      if (popValid) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 9),
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
                              builder: (context) => DummyPage()));
                    },
                  ),
                  Text(
                    "Sell",
                    style: TextStyle(color: Colors.white, fontSize: 9),
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
                    "Chat",
                    style: TextStyle(color: Colors.white, fontSize: 9),
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
                    onPressed: () {},
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 9),
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
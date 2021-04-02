import 'package:WIBI/login/invalid_login.dart';
import 'package:WIBI/profile/profile_screen.dart';
import 'package:WIBI/sell/sellproduct.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './enums.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  Future<void> _launched;

  String _launchUrl = 'https://wibi-group.slack.com';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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
                    onPressed: () {
                      setState(() {
                        _launched = _launchInApp(_launchUrl);
                      });
                    },
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

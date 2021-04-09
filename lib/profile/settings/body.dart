//import 'package:WIBI/profile/personal_details/personal.dart';

import 'package:WIBI/profile/settings/donate.dart';
import 'package:WIBI/profile/settings/help.dart';
import 'package:WIBI/profile/settings/settings_pic.dart';
import 'package:WIBI/splash/splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'settings_menu.dart';

class Body extends StatelessWidget {
  Future<void> _signOut() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();

    runApp(new MaterialApp(
      home: SplashScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SettingsPic(),
          SizedBox(height: 30),
          ProfileMenu(
            text: "Help",
            icon: "assets/images/help.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => HelpScreen(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Donate",
            icon: "assets/images/donate.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => DonateScreen(),
                ),
              );
            },
          ),
          /*   ProfileMenu(
            text: "Settings",
            icon: "assets/images/settings.svg",
            press: () {},
          ), */

          SizedBox(height: 30),
          SizedBox(
            width: 150,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    blurRadius: 6.0,
                    offset: Offset(4.0, 4.0),
                  ),
                ],
              ),
              // ignore: deprecated_member_use
              child: RaisedButton(
                splashColor: Colors.white,
                color: Color(0xFF1264D1),
                onPressed: () {
                  _signOut();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                textColor: Colors.white,
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

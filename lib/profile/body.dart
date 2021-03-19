import 'package:WIBI/admin/admin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './profile_menu.dart';
import './profile_pic.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:WIBI/variables.dart';

class Body extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 25),
          ProfileMenu(
            text: "Personal Details",
            icon: "assets/images/personal details.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "My Posts",
            icon: "assets/images/my posts.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "My Wishlist",
            icon: "assets/images/wishlist.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help",
            icon: "assets/images/help.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/images/settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Admin Panel",
            icon: "assets/images/admin profile.svg",
            press: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => AdminScreen()));
            },
          ),
          /*   ProfileMenu(
            text: "Logout",
            icon: "assets/images/logout.svg",
            press: () {},
          ), */
          SizedBox(height: 20),
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
              child: RaisedButton(
                splashColor: Colors.white,
                color: Color(0xFF1264D1),
                /*    onPressed: () {
                  _gSignIn.signOut();
                  print('Signed out');
                  if (popValid) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                }, */
                onPressed: _signOut,
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

/* Future<void> _signOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
} */

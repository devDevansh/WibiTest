import 'package:WIBI/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'body.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left_rounded,
            size: 40.0,
            color: Colors.white,
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
        centerTitle: true,
        title: Text(
          "Settings",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Body(),
        ],
      ),
    );
  }
}

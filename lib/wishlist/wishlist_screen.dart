import 'package:WIBI/home/home_screen.dart';

import 'package:flutter/material.dart';

import 'WishlistCard.dart';

class WishlistScreen extends StatelessWidget {
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
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Wishlist",
            ),
          ],
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: WishlistCard(),
    );
  }
}

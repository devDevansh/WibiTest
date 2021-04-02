import 'package:WIBI/home/home_screen.dart';

import 'package:flutter/material.dart';

import 'NotificationCard.dart';

class NotificationScreen extends StatelessWidget {
/*   final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;

  WishlistScreen({
    Key key,
    @required this.id,
    @required this.title,
    @required this.category,
    @required this.location,
    @required this.image,
    @required this.price,
  }) : super(key: key); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
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
              "Notifications",
            ),
            /* Text(
              "${products.length} items",
              style: Theme.of(context).textTheme.caption,
            ), */
          ],
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: NotificationCard(),
    );
  }
}

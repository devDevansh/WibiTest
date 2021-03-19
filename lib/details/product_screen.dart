import 'package:WIBI/home/home_screen.dart';

import 'package:flutter/material.dart';

import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;

  ProductScreen({
    Key key,
    @required this.id,
    @required this.title,
    @required this.category,
    @required this.location,
    @required this.image,
    @required this.price,
  }) : super(key: key);

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
        title: Text(
          "Wibi!",
          style: TextStyle(
            fontFamily: 'Grilled Cheese',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Body(
        id: id,
        title: title,
        category: category,
        location: location,
        image: image,
        price: price,
      ),
    );
  }
}

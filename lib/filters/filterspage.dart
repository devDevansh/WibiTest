import 'package:WIBI/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'categorypage.dart';
import 'datepage.dart';
import 'pricepage.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
        backgroundColor: Color(0xFF1264D1),
        centerTitle: true,
        title: Text(
          'Filters',
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              // ignore: deprecated_member_use
              child: FlatButton(
                height: 80,
                padding: EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: 20,
                  right: 20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color(0xFFF2F2F0),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => CategoryPage()));
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/category.svg",
                      color: Color(0xFF342E37),
                      width: 40,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Filter by categories",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_rounded,
                      size: 40,
                      color: Color(0xFF342E37),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(height: 9),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              // ignore: deprecated_member_use
              child: FlatButton(
                height: 80,
                padding: EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: 20,
                  right: 20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color(0xFFF2F2F0),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Date()));
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/date.svg",
                      color: Color(0xFF342E37),
                      width: 40,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Sort by date",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_rounded,
                      size: 40,
                      color: Color(0xFF342E37),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //   const SizedBox(height: 9),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),

              // ignore: deprecated_member_use
              child: FlatButton(
                height: 80,
                padding: EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: 20,
                  right: 20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color(0xFFF2F2F0),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Price()));
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/price.svg",
                      color: Color(0xFF342E37),
                      width: 40,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Sort by price",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_rounded,
                      size: 40,
                      color: Color(0xFF342E37),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //const SizedBox(height: 9),
        ],
      ),
    ));
  }
}

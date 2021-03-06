import 'package:WIBI/admin/admin_screen.dart';
import 'package:WIBI/admin/product_page.dart/add_product/addproduct.dart';
import 'package:WIBI/admin/product_page.dart/remove_product/remove_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageProducts extends StatelessWidget {
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
                builder: (context) => AdminScreen(),
              ),
            );
          },
        ),
        backgroundColor: Color(0xFF1264D1),
        centerTitle: true,
        title: Text(
          'Manage Products',
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
                      builder: (context) => AddProduct(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/add.svg",
                      color: Color(0xFF342E37),
                      width: 40,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Add Products",
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
                      builder: (context) => RemoveProduct(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/remove.svg",
                      color: Color(0xFF342E37),
                      width: 40,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Remove Products",
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

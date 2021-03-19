import 'package:WIBI/components/icon_btn_with_counter.dart';

import 'package:WIBI/filters/filterspage.dart';
//import 'package:WIBI/wishlist/components/WishlistCard.dart';
//import 'package:WIBI/wishlist/components/body.dart';
import 'package:WIBI/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

import 'package:WIBI/components/size_config.dart';

import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(12),
            right: getProportionateScreenWidth(8),
          ),
          child: Text(
            "Wibi!",
            style: TextStyle(
              fontFamily: 'Grilled Cheese',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xFF1264D1),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(5),
            ),
            child: SearchField(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(5),
          ),
          child: IconBtnWithCounter(
            svgSrc: "assets/icons/filter.svg",
            press: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => FilterPage()));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(5),
          ),
          child: IconBtnWithCounter(
            svgSrc: "assets/icons/wishlist.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => WishlistScreen(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(8),
          ),
          child: IconBtnWithCounter(
            svgSrc: "assets/icons/bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ),
      ],
    );
  }
}

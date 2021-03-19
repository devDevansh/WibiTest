//import 'package:WIBI/ProductClass.dart';
import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';

import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;

  ProductDescription({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(35),
            right: getProportionateScreenWidth(35),
            top: getProportionateScreenWidth(5),
            bottom: getProportionateScreenWidth(15),
          ),
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Visby Round',
              fontWeight: FontWeight.bold,
              color: Color(0xFF455A64),
              fontSize: 30.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(35),
            right: getProportionateScreenWidth(35),
            top: getProportionateScreenWidth(0),
            bottom: getProportionateScreenWidth(10),
          ),
          child: Row(
            children: [
              Text(
                'Description :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF546E7A),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(width: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getProportionateScreenWidth(148),
                    child: Text(
                      category,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1264D1),
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  //SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(35),
            right: getProportionateScreenWidth(35),
            top: getProportionateScreenWidth(0),
            bottom: getProportionateScreenWidth(15),
          ),
          child: Row(
            children: [
              Text(
                'Price :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF546E7A),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "\u{20B9}\u{0020}$price",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1264D1),
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(35),
            right: getProportionateScreenWidth(35),
            top: getProportionateScreenWidth(0),
            bottom: getProportionateScreenWidth(20),
          ),
          child: Row(
            children: [
              Text(
                'Location :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF546E7A),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(width: 5),
              Text(
                location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1264D1),
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

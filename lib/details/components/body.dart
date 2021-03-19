import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/variables.dart';
//import 'package:WIBI/details/components/ProductClass.dart';
//import 'package:WIBI/wishlist/WishlistClass.dart';
//import 'package:WIBI/wishlist/components/WishlistClass.dart';
//import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'product_description.dart';
//import 'package:like_button/like_button.dart';

class Body extends StatefulWidget {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;

  Body({
    Key key,
    @required this.id,
    @required this.title,
    @required this.category,
    @required this.location,
    @required this.image,
    @required this.price,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void postProduct(String ts, String title, String image, int price) async {
    //print(ts);
    //print("log");
    Map m = {
      "user_id": userEmail,
      "product_id": ts,
      title: title,
      image: image,
      price: price
    };
    //print(m);
    var encodedData = jsonEncode(m);
    await http.post("http://10.0.2.2:8080/wishlists", body: encodedData);
  }
  /*  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return postProduct(widget.id),
  } */

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1.02,
            child: Hero(
              tag: widget.id,
              child: Image.network(widget.image),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 20,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 10.0,
                offset: Offset(0.0, -4.0),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(63),
              topRight: Radius.circular(63),
            ),
          ),
          child: Column(
            children: [
              ProductDescription(
                id: widget.id,
                title: widget.title,
                category: widget.category,
                location: widget.location,
                image: widget.image,
                price: widget.price,
              ),
              Container(
                // height: getProportionateScreenHeight(170),
                padding: EdgeInsets.only(top: 13, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF1264D1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 10.0,
                      offset: Offset(0.0, -4.0),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(63),
                    topRight: Radius.circular(63),
                  ),
                ),
                child: SafeArea(
                    top: false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/wishlist.svg",
                                color: Colors.white,
                                width: 28.5,
                                height: 28.5,
                              ),
                              onPressed: () {
                                postProduct(widget.id, widget.title,
                                    widget.image, widget.price);
                              },
                            ),
                            /*   LikeButton(
                              size: 38,
                              circleColor: CircleColor(
                                start: Color(0xffff0266),
                                end: Color(0xFFF06292),
                              ),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Color(0xFFF06292),
                                dotSecondaryColor: Color(0xFFF48FB1),
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite_rounded,
                                  color: isLiked
                                      ? Color(0xffff0266)
                                      : Colors.white,
                                  size: 36,
                                );
                              },
                              //  onTap: onLikeButtonTapped,
                              //onTap: postProduct(widget.id),
                            ), */
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/chat.svg",
                                color: Colors.white,
                                width: 28.5,
                                height: 28.5,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Add to Wishlist",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Slack with Seller",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

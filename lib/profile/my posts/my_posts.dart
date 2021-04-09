import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/details/components/ProductClass.dart';
import 'package:WIBI/profile/profile_screen.dart';

import 'package:flutter/material.dart';

import 'package:WIBI/variables.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyPosts extends StatefulWidget {
  final double width, aspectRatio;

  const MyPosts({
    this.width = 250,
    this.aspectRatio = 1.02,
  });

  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  Future<List<NewProduct>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/products");
    var jsonData = json.decode(proData.body);
    List<NewProduct> products = [];
    for (var p in jsonData) {
      if (p["email"] == userEmail) {
        NewProduct prod = NewProduct(
          p["id"],
          p["title"],
          p["category"],
          p["location"],
          p["image"],
          p["price"],
          p["description"],
          p["email"],
        );
        products.add(prod);
      }
    }
    print(products.length);
    return products;
  }

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
          "My Posts",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return SizedBox(
                height: getProportionateScreenHeight(580),
                child: Center(
                  child: Text(
                    'Posts are Empty!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Color(0xFF1264D1),
                      fontFamily: 'Visby Round',
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(10),
                  left: getProportionateScreenWidth(10),
                  right: getProportionateScreenWidth(10),
                ),
                /* child: SizedBox(
                width: getProportionateScreenWidth(widget.width), */
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => ProductClass(
                                snapshot.data[index].id,
                                snapshot.data[index].title,
                                snapshot.data[index].category,
                                snapshot.data[index].location,
                                snapshot.data[index].image,
                                snapshot.data[index].price,
                                snapshot.data[index].description,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1.02,
                              child: Container(
                                padding: EdgeInsets.all(
                                  getProportionateScreenWidth(20),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2F2F0),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Hero(
                                  tag: snapshot.data[index].id,
                                  child:
                                      /* Image.network(
                                  snapshot.data[index].image,
                                ), */
                                      FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image: snapshot.data[index].image,
                                  ),
                                ),
                              ),
                            ),
                            //const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(110),
                                  child: Text(
                                    snapshot.data[index].title,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color: Color(0xFF342E37),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  //width: getProportionateScreenWidth(150),
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: getProportionateScreenWidth(5),
                                        //bottom: getProportionateScreenWidth(5),
                                        //left: getProportionateScreenWidth(5),
                                        //right: getProportionateScreenWidth(5),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F2F0),
                                        //shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF2F2F0),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),

                                        child: IconButton(
                                          icon: SvgPicture.asset(
                                            "assets/images/sold.svg",
                                            color: Color(0xFF342E37),
                                            width: 20,
                                            height: 20,
                                          ),
                                          onPressed: () {
                                            /*     postProduct(
                                              snapshot.data[index].id,
                                              snapshot.data[index].title,
                                              snapshot.data[index].category,
                                              snapshot.data[index].location,
                                              snapshot.data[index].image,
                                              snapshot.data[index].price,
                                              snapshot.data[index].description,
                                            ); */
                                          },
                                        ),

                                        /*          child: LikeButton(
                                          size: 27,
                                          circleColor: CircleColor(
                                            start: Color(0xffff0266),
                                            end: Color(0xFFF06292),
                                          ),
                                          bubblesColor: BubblesColor(
                                            dotPrimaryColor: Color(0xFFF06292),
                                            dotSecondaryColor:
                                                Color(0xFFF48FB1),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.favorite_rounded,
                                              color: isLiked
                                                  ? Color(0xffff0266)
                                                  : Color(0xFF607D8B),
                                              size: 30,
                                            );
                                          },
                                          //onTap: onLikeButtonTapped,
                                          onTap: postProduct(
                                            snapshot.data[index].id,
                                            snapshot.data[index].title,
                                            snapshot.data[index].image,
                                            snapshot.data[index].price,
                                          ),
                                        ), */
                                        //  ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "\u{20B9}\u{0020}${snapshot.data[index].price}",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF342E37),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Product {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;

  final int price;
  final String description;
  final String email;

  Product(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    this.description,
    this.email,
  );
}

class NewProduct {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;

  final int price;
  final String description;
  final String email;

  NewProduct(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    this.description,
    this.email,
  );
}

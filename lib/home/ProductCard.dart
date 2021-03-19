import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/details/components/ProductClass.dart';

import 'package:flutter/material.dart';

import 'package:WIBI/variables.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:like_button/like_button.dart';

class ProductCard extends StatefulWidget {
  final double width, aspectRatio;

  const ProductCard({
    this.width = 250,
    this.aspectRatio = 1.02,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void postProduct(String ts) async {
    print(ts);
    print("log");
    Map m = {"user_id": userEmail, "product_id": ts};
    print(m);
    var encodedData = jsonEncode(m);
    await http.post("http://10.0.2.2:8080/wishlists", body: encodedData);
  }

  Future<List<Product>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/products");
    var jsonData = json.decode(proData.body);
    List<Product> products = [];
    for (var prod in jsonData) {
      Product product = Product(
        prod["id"],
        prod["title"],
        prod["category"],
        prod["location"],
        prod["image"],
        prod["price"],
        //prod["description"],
      );
      products.add(product);
    }
    print(products.length);
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return SizedBox(
              height: getProportionateScreenHeight(580),
              child: Center(
                child: Text(
                  'Loading...',
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
              height: getProportionateScreenHeight(575),
              padding: EdgeInsets.all(getProportionateScreenWidth(1)),
              child: SizedBox(
                width: getProportionateScreenWidth(widget.width),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: getProportionateScreenWidth(10),
                      ),
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
                                //snapshot.data[index].description,
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
                                    getProportionateScreenWidth(20)),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2F2F0),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Hero(
                                  tag: snapshot.data[index].id,
                                  child:
                                      Image.network(snapshot.data[index].image),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(205),
                                  child: Text(
                                    snapshot.data[index].title,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      color: Color(0xFF263238),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  //width: getProportionateScreenWidth(150),
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: getProportionateScreenWidth(7),
                                        bottom: getProportionateScreenWidth(7),
                                        left: getProportionateScreenWidth(7),
                                        right: getProportionateScreenWidth(7),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F2F0),
                                        //shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          postProduct(snapshot.data[index].id);
                                        },

                                        child: LikeButton(
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
                                          //onTap: postProduct(widget.id),
                                        ),
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
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF263238),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
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
  //final String description;

  Product(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    //this.description,
  );
}

//import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:WIBI/details/components/ProductClass.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class WishlistCard extends StatefulWidget {
  final double width, aspectRatio;

  const WishlistCard({
    this.width = 250,
    this.aspectRatio = 1.02,
  });

  @override
  _WishlistCardState createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  deleteProduct(String id) async {
    await http.delete("http://10.0.2.2:8080/wishlists/$id");
  }

  Future<List<Wishlist>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/wishlists");
    var jsonData = json.decode(proData.body);
    List<Wishlist> products = [];
    for (var prod in jsonData) {
      Wishlist product = Wishlist(
        prod["id"],
        prod["title"],
        prod["category"],
        prod["location"],
        prod["image"],
        prod["price"],
        prod["description"],
      );
      products.add(product);
    }
    print(products.length);
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                    child: Text(
                  'Wishlist is Empty!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Color(0xFF1264D1),
                    fontFamily: 'Visby Round',
                  ),
                )),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: getProportionateScreenHeight(150),
                    margin: EdgeInsets.only(
                      top: getProportionateScreenWidth(10),
                      bottom: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(17),
                      right: getProportionateScreenWidth(17),
                    ),
                    child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        /*   setState(() {
                                      products.removeAt(snapshot.data[index]);
                                    }); */
                        setState(() {
                          deleteProduct(snapshot.data[index].id);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm"),
                              content: const Text(
                                "Are you sure you wish to delete this item?",
                                style: TextStyle(
                                  color: Color(0xFF342E37),
                                ),
                              ),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        decoration: BoxDecoration(
                          color: Color(0xFF1264D1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.delete_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(10),
                          bottom: getProportionateScreenWidth(10),
                          left: getProportionateScreenWidth(17),
                          right: getProportionateScreenWidth(17),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F0),
                          borderRadius: BorderRadius.circular(5),
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
                                  snapshot.data[index].description,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 88,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    snapshot.data[index].image,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: getProportionateScreenWidth(195),
                                        child: Text(
                                          snapshot.data[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xFF342E37),
                                              fontSize: 16),
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "\u{20B9}\u{0020}${snapshot.data[index].price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF342E37),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Wishlist {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;

  final int price;
  final String description;

  Wishlist(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    this.description,
  );
} 

/* import 'dart:async';

import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/details/components/ProductClass.dart';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class WishlistCard extends StatefulWidget {
  @override
  _WishlistCardState createState() => new _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  deleteProduct(String id) async {
    await http.delete("http://10.0.2.2:8080/wishlists/$id");
  }

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map product in responseJson) {
        _productDetails.add(ProductDetails.fromJson(product));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _productDetails == null
            ? Container(
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
                )),
              )
            : ListView.builder(
                itemCount: _productDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: getProportionateScreenHeight(150),
                    margin: EdgeInsets.only(
                      top: getProportionateScreenWidth(10),
                      bottom: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(17),
                      right: getProportionateScreenWidth(17),
                    ),
                    child: Dismissible(
                      key: Key(_productDetails[index].id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          deleteProduct(_productDetails[index].id);
                          _productDetails.removeAt(index);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm"),
                              content: const Text(
                                "Are you sure you wish to delete this item?",
                                style: TextStyle(
                                  color: Color(0xFF342E37),
                                ),
                              ),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        decoration: BoxDecoration(
                          color: Color(0xFF1264D1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.delete_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(10),
                          bottom: getProportionateScreenWidth(10),
                          left: getProportionateScreenWidth(17),
                          right: getProportionateScreenWidth(17),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => ProductClass(
                                  _productDetails[index].id,
                                  _productDetails[index].title,
                                  _productDetails[index].category,
                                  _productDetails[index].location,
                                  _productDetails[index].image,
                                  _productDetails[index].price,
                                  //snapshot.data[index].description,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 88,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    _productDetails[index].image,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: getProportionateScreenWidth(170),
                                        child: Text(
                                          _productDetails[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xFF342E37),
                                              fontSize: 16),
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "\u{20B9}\u{0020}${_productDetails[index].price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF342E37),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.delete_rounded,
                                      size: 25,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

      ),
    );
  }
}

List<ProductDetails> _productDetails = [];

final String url = 'http://10.0.2.2:8080/wishlists';

class ProductDetails {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;

  ProductDetails({
    @required this.id,
    @required this.title,
    @required this.category,
    @required this.location,
    @required this.image,
    @required this.price,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return new ProductDetails(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      location: json['location'],
      image: json['image'],
      price: json['price'],
    );
  }
}
 */
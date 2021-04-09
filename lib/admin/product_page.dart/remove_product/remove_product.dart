import 'package:WIBI/admin/product_page.dart/productpage.dart';

import 'package:WIBI/components/size_config.dart';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoveProduct extends StatefulWidget {
  final double width, aspectRatio;

  const RemoveProduct({
    this.width = 250,
    this.aspectRatio = 1.02,
  });

  @override
  _RemoveProductState createState() => _RemoveProductState();
}

class _RemoveProductState extends State<RemoveProduct> {
  deleteProduct(String id) async {
    await http.delete("http://10.0.2.2:8080/products/$id");
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
                builder: (context) => ManageProducts(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Remove Products",
            ),
            /* Text(
              "${products.length} items",
              style: Theme.of(context).textTheme.caption,
            ), */
          ],
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: FutureBuilder(
          future: _getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
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
                              title: const Text(
                                "Caution!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: const Text(
                                "The product can't be recovered. Do you wish to proceed?",
                                style: TextStyle(
                                  color: Color(0xFF342E37),
                                  fontWeight: FontWeight.w600,
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
                          onTap: () {},
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
                                        width: getProportionateScreenWidth(170),
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

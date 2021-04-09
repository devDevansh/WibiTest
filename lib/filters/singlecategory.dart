import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/details/components/ProductClass.dart';
import 'package:WIBI/filters/categorypage.dart';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingleCategory extends StatefulWidget {
  final double width, aspectRatio;
  final String category;

  const SingleCategory({
    this.width = 250,
    this.aspectRatio = 1.02,
    this.category,
  });

  @override
  _SingleCategoryState createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  Future<List<NewProduct>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/products");
    var jsonData = json.decode(proData.body);
    List<NewProduct> products = [];
    for (var p in jsonData) {
      if (p["category"] == widget.category) {
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
                builder: (context) => CategoryPage(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          widget.category,
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
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image: snapshot.data[index].image,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 5),
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

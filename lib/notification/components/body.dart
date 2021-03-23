import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:WIBI/details/components/ProductClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  final double width, aspectRatio;

  const Body({
    this.width = 250,
    this.aspectRatio = 1.02,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Notifications>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/notification");
    var jsonData = json.decode(proData.body);
    List<Notifications> products = [];
    for (var prod in jsonData) {
      Notifications product = Notifications(
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
                      key: Key(snapshot.data[index].id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        /*   setState(() {
                               products.removeAt(snapshot.data[index]);
                             }); */
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
                                          "Hurray! a new product was added.",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xFF342E37),
                                              fontSize: 16),
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: getProportionateScreenWidth(170),
                                        child: Text(
                                          snapshot.data[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xFF342E37),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          maxLines: 1,
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
              );
            }
          },
        ),
      ),
    );
  }
}

class Notifications {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;

  final int price;
  //final String description;

  Notifications(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    //this.description,
  );
}

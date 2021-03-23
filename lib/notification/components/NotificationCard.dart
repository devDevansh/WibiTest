/* import 'dart:async';
import 'package:WIBI/details/components/ProductClass.dart';
import 'package:WIBI/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:WIBI/components/size_config.dart';
//import 'package:WIBI/details/product_screen.dart';
import 'package:flutter/material.dart';

/* class WishlistCard extends StatefulWidget {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;

  const WishlistCard({
    Key key,
    @required this.id,
    @required this.title,
    @required this.category,
    @required this.location,
    @required this.image,
    @required this.price,
  }) : super(key: key);

  @override
  _WishlistCardState createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  /* void postProduct(String ts) async {
    print(ts);
    print("log");
    Map m = {"user_id": userEmail, "product_id": ts};
    print(m);
       var encoded_data = jsonEncode(m);
    await http.post("http://10.0.2.2:8080/products", body: encoded_data); 
  }  */
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => ProductScreen(
              id: widget.id,
              title: widget.title,
              category: widget.category,
              location: widget.location,
              image: widget.image,
              price: widget.price,
            ),
          ),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(widget.image),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text(
                "\u{20B9}\u{0020}${widget.price}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
} */
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
/*   void postProduct(String ts) async {
    print(ts);
    print("log");
    Map m = {"user_id": userEmail, "product_id": ts};
    print(m);
    var encodedData = jsonEncode(m);
    await http.post("http://10.0.2.2:8080/wishlists", body: encodedData);
  } */

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
            return Container(
              child: Text('Loading...'),
            );
          } else {
            return Container(
              height: 540,
              padding: EdgeInsets.all(getProportionateScreenWidth(1)),
              child: SizedBox(
                width: getProportionateScreenWidth(widget.width),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
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
                              aspectRatio: 0.88,
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(10)),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                  snapshot.data[index].image,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 2,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "\u{20B9}\u{0020}${snapshot.data[index].price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          )
                        ],
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

class Wishlist {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;

  final int price;
  //final String description;

  Wishlist(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    //this.description,
  );
}
 */

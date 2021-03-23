import 'dart:async';
import 'package:WIBI/filters/filterspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Date extends StatefulWidget {
  Date({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  Future<List<Products>> _getProducts() async {
    var productData = await get("http://10.0.2.2:8080/date");
    var jsonData = jsonDecode(productData.body);

    List<Products> products = [];

    for (var u in jsonData) {
      Products p = new Products(u["title"], u["category"], u["image"],
          u["location"], u["price"], u["date"]);
      products.add(p);
    }

    print("printing the length here ");
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
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => FilterPage()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Sorted by Date",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading...."),
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      selectedTileColor: Color(0xFF1264D1),
                      //horizontalTitleGap: 20.0,
                      //minVerticalPadding: 30.0,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            // print the image of the product here
                            // using the snapshot.data[index].image;
                            //'https://crazylister.com/wp-content/uploads/2018/05/Amazon-Top-Sellers.png'
                            snapshot.data[index].image),
                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].price.toString()),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(snapshot.data[index]),
                            ));
                      });
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Products p;
  ProductDetails(this.p);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
    );
  }
}

class Products {
  String title;
  String category;
  String image;
  String location;
  int price;
  String data;

  Products(this.title, this.category, this.image, this.location, this.price,
      this.data);
}

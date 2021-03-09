import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new myHomePage(title: 'Users'),
    );
  }
}

class myHomePage extends StatefulWidget {
  myHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  Future<List<Products>> _getProducts() async {
    var product_data = await get("http://10.0.2.2:8080/products/books");
    var json_data = jsonDecode(product_data.body);

    List<Products> products = [];

    for (var u in json_data) {
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
        title: Text('Products'),
        backgroundColor: Colors.blue,
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
                      selectedTileColor: Colors.blue,
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
                      subtitle: Text(snapshot.data[index].location),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    productdetails(snapshot.data[index])));
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

class productdetails extends StatelessWidget {
  final Products p;
  productdetails(this.p);

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

import 'dart:async';

import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/details/components/ProductClass.dart';
import 'package:WIBI/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => new _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController controller = new TextEditingController();

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
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Search Product'),
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
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            color: Color(0xFF1264D1),
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search_rounded),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        /* hintText: 'Search' */ border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel_rounded),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? Container(
                    padding: EdgeInsets.only(
                      top: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(10),
                    ),
                    child: new GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: _searchResult.length,
                      itemBuilder: (context, i) {
                        return Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => ProductClass(
                                    _searchResult[i].id,
                                    _searchResult[i].title,
                                    _searchResult[i].category,
                                    _searchResult[i].location,
                                    _searchResult[i].image,
                                    _searchResult[i].price,
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
                                      getProportionateScreenWidth(20),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F2F0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Hero(
                                      tag: _searchResult[i].id,
                                      child: Image.network(
                                        _searchResult[i].image,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: getProportionateScreenWidth(110),
                                  child: Text(
                                    _searchResult[i].title,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color: Color(0xFF342E37),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\u{20B9}\u{0020}${_searchResult[i].price}",
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
                  )
                : Container(
                     padding: EdgeInsets.only(
                      top: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(10),
                    ),
                    child: new GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: _productDetails.length,
                      itemBuilder: (context, index) {
                        return Container(
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
                                      tag: _productDetails[index].id,
                                      child: Image.network(
                                        _productDetails[index].image,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: getProportionateScreenWidth(150),
                                  child: Text(
                                    _productDetails[index].title,
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
                                  "\u{20B9}\u{0020}${_productDetails[index].price}",
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
                    ), git
                    ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _productDetails.forEach((productDetail) {
      if (productDetail.title.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(productDetail);
    });

    setState(() {});
  }
}

List<ProductDetails> _searchResult = [];

List<ProductDetails> _productDetails = [];

final String url = 'http://10.0.2.2:8080/products';

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

//import 'package:flutter/material.dart';

class ProductDetails {
  String id;
  String title;

  String category;
  String location;
  String image;

  int expectedprice;
  String description;
  String date;
  String issold;

  //String description;

  ProductDetails(
    String id,
    String title,
    String category,
    String location,
    String image,
    int expectedprice,
    String description,
    String date,
    String issold,
  ) {
    this.id = id;
    this.title = title;

    this.category = category;
    this.location = location;
    this.image = image;

    this.expectedprice = expectedprice;
    this.description = description;
    this.date = date;
    this.issold = issold;
  }

  Map mappedjson() {
    Map data = {
      "id": this.id,
      "title": this.title,
      "category": this.category,
      "location": this.location,
      "iamge": this.image,
      "expectedprice": this.expectedprice,
      "description": this.description,
      "date": this.date,
      "issold": this.issold,
    };
    return data;
  }
}

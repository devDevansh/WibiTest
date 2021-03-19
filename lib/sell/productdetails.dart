//import 'package:flutter/material.dart';

class ProductDetails {
  String title;
  String description;
  String expectedprice;
  String location;
  String category;

  ProductDetails(String title, String description, String expectedprice,
      String location, String category) {
    this.title = title;
    this.description = description;
    this.expectedprice = expectedprice;
    this.location = location;
    this.category = category;
  }

  Map mappedjson() {
    Map data = {
      "title": this.title,
      "description": this.description,
      "expectedprice": this.expectedprice,
      "location": this.location,
      "category": this.category,
      "role": "products",
    };
    return data;
  }
}

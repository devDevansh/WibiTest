import 'package:WIBI/details/product_screen.dart';
import 'package:flutter/material.dart';

class ProductClass extends StatelessWidget {
  final String id;
  final String title;
  final String category;
  final String location;
  final String image;
  final int price;
  final String description;

  ProductClass(
    this.id,
    this.title,
    this.category,
    this.location,
    this.image,
    this.price,
    this.description,
  );
  @override
  Widget build(BuildContext context) {
    return ProductScreen(
      id: id,
      title: title,
      category: category,
      location: location,
      image: image,
      price: price,
      description: description,
    );
  }
}

import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/home/ProductCard.dart';
//import 'package:WIBI/components/ProductCard.dart';
//import 'package:WIBI/home/ProductCard.dart';
//import 'package:WIBI/home/popular_product.dart';
import 'package:flutter/material.dart';

//import './size_config.dart';
import './home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(15)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            //PopularProducts(),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

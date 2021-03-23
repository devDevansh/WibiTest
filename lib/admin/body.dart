import 'package:WIBI/admin/account_page.dart/accountpage.dart';
import 'package:WIBI/admin/analytics.dart/charts.dart';
import 'package:WIBI/admin/category_page.dart/categorypage.dart';
import 'package:WIBI/admin/product_page.dart/productpage.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:flutter/material.dart';
import './admin_menu.dart';
import './admin_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
      ),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          AdminMenu(
            text: "Manage Accounts",
            icon: "assets/images/manage accounts.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ManageAccounts(),
                ),
              );
            },
          ),
          AdminMenu(
            text: "Manage Products",
            icon: "assets/images/manage products.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ManageProducts(),
                ),
              );
            },
          ),
          AdminMenu(
            text: "Manage Categories",
            icon: "assets/images/category.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => ManageCategories(),
                ),
              );
            },
          ),
          AdminMenu(
            text: "Analytics",
            icon: "assets/images/analytics.svg",
            press: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => AnalyticsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

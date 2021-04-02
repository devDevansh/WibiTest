import 'package:WIBI/admin/category_page.dart/categorypage.dart';
import 'package:WIBI/components/size_config.dart';

//import 'package:WIBI/filters/singlecategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoveCategory extends StatefulWidget {
  @override
  _RemoveCategoryState createState() => _RemoveCategoryState();
}

class _RemoveCategoryState extends State<RemoveCategory> {
  deleteCategory(String category) async {
    await http.delete("http://10.0.2.2:8080/category/$category");
  }
  /* void post_product(String s) async {
    print(s);
    print("log");
    Map m = {"id": user_email, "category": s};
    print(m);
    /*   var encoded_data = jsonEncode(m);
    await http.post("http://10.0.2.2:8080/products", body: encoded_data); */
  } */

  Future<List<Categories>> _getProduct() async {
    var empData = await http.get("http://10.0.2.2:8080/category");
    var jsonData = json.decode(empData.body);

    Set s = new Set();
    for (var v in jsonData) {
      s.add(v["category"]);
    }
    List<Categories> employees = [];
    for (var emp in s) {
      Categories c = new Categories(emp);
      employees.add(c);
    }
    print(employees.length);
    return employees;
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
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => ManageCategories()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Categories",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
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
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        /*   setState(() {
                                      products.removeAt(snapshot.data[index]);
                                    }); */
                        setState(() {
                          deleteCategory(snapshot.data[index].category);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Caution!"),
                              content: const Text(
                                "The category can't be recovered. Do you wish to proceed?",
                                style: TextStyle(
                                  color: Color(0xFF342E37),
                                ),
                              ),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
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
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                "assets/images/category.svg",
                                width: 40,
                                color: Color(0xFF342E37),
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
                                        width: getProportionateScreenWidth(230),
                                        child: Text(
                                          snapshot.data[index].category,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xFF342E37),
                                              fontSize: 16),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  /* SafeArea(
                    child: Dismissible(
                      key: Key(snapshot.data[index].category),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        /*   setState(() {
                                      products.removeAt(snapshot.data[index]);
                                    }); */
                        setState(() {
                          deleteCategory(snapshot.data[index].category);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm"),
                              content: const Text(
                                "Are you sure you wish to delete this item?",
                                style: TextStyle(
                                  color: Color(0xFF342E37),
                                ),
                              ),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                                // ignore: deprecated_member_use
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1264D1),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
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
                        margin: EdgeInsets.only(
                          top: getProportionateScreenWidth(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            height: 80,
                            padding: EdgeInsets.only(
                              top: 40,
                              bottom: 40,
                              left: 20,
                              right: 20,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Color(0xFFF2F2F0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => SingleCategory()));
                            },
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                SvgPicture.asset(
                                  "assets/images/category.svg",
                                  width: 40,
                                  color: Color(0xFF342E37),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    width: getProportionateScreenWidth(170),
                                    child: Text(
                                      snapshot.data[index].category,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xFF342E37),
                                          fontSize: 15),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ); */
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Categories {
  String category;
  Categories(this.category);
}

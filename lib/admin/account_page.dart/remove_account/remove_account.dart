import 'package:WIBI/admin/account_page.dart/accountpage.dart';
//import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoveAccount extends StatefulWidget {
  final double width, aspectRatio;

  const RemoveAccount({
    this.width = 250,
    this.aspectRatio = 1.02,
  });

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  deleteUsers(String email) async {
    await http.delete("http://10.0.2.2:8080/users/$email");
  }

  Future<List<Users>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/users");
    var jsonData = json.decode(proData.body);
    List<Users> users = [];
    for (var u in jsonData) {
      Users user = Users(
        u["name"],
        u["email"],
        u["location"],
        u["designation"],
        u["contact"],
      );
      users.add(user);
    }
    print(users.length);
    return users;
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
                builder: (context) => ManageAccounts(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Remove Accounts",
            ),
            /* Text(
              "${users.length} items",
              style: Theme.of(context).textTheme.caption,
            ), */
          ],
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
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
                          deleteUsers(snapshot.data[index].email);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "Caution!",
                                style: TextStyle(
                                  color: Color(0xFF342E37),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: const Text(
                                "The user can't be recovered. Do you wish to proceed?",
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
                                "assets/images/userprofile.svg",
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
                                          snapshot.data[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xFF342E37),
                                              fontSize: 16),
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: getProportionateScreenWidth(230),
                                        child: Text(
                                          snapshot.data[index].email,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF342E37),
                                          ),
                                          maxLines: 1,
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
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Users {
  final String name;
  final String email;
  final String location;
  final String designation;
  final String contact;

  Users(
    this.name,
    this.email,
    this.location,
    this.designation,
    this.contact,
  );
}

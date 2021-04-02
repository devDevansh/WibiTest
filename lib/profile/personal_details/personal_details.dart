import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/profile/profile_screen.dart';
import 'package:WIBI/variables.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  Future<List<NewUser>> _getProduct() async {
    var proData = await http.get("http://10.0.2.2:8080/users");
    var jsonData = json.decode(proData.body);
    List<NewUser> users = [];
    for (var u in jsonData) {
      // Users user = Users(
      //   u["name"],
      //   u["email"],
      //   u["location"],
      //   u["designation"],
      //   u["contact"],
      // );
      // users.add(user);
      if (u["email"] == userEmail) {
        // print(u["name"]);
        // print(u["email"]);
        // print(u["location"]);
        // print(u["designation"]);
        // print(u["contact"]);
        NewUser usr = NewUser(
          u["name"],
          u["email"],
          u["location"],
          u["designation"],
          u["contact"],
        );
        users.add(usr);
        globaluserdesignation = u["designation"];
        globaluserlocation = u["location"];
        globalusercontact = u["contact"];
        print("log");
        print(globaluserdesignation);
        //n = usr;
      }
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
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Personal Details",
            ),
          ],
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(35),
                          right: getProportionateScreenWidth(10),
                          top: getProportionateScreenWidth(0),
                          bottom: getProportionateScreenWidth(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'NAME :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              width: getProportionateScreenWidth(160),
                              child: Text(
                                userName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1264D1),
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(35),
                          right: getProportionateScreenWidth(35),
                          top: getProportionateScreenWidth(0),
                          bottom: getProportionateScreenWidth(15),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'EMAIL :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Text(
                              userEmail,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1264D1),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(35),
                          right: getProportionateScreenWidth(35),
                          top: getProportionateScreenWidth(0),
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'DESIGNATION :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              width: getProportionateScreenWidth(239),
                              child: Text(
                                snapshot.data[index].designation,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1264D1),
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(35),
                          right: getProportionateScreenWidth(35),
                          top: getProportionateScreenWidth(0),
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'LOCATION :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              width: getProportionateScreenWidth(202),
                              child: Text(
                                snapshot.data[index].location,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1264D1),
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(35),
                          right: getProportionateScreenWidth(35),
                          top: getProportionateScreenWidth(0),
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'CONTACT :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Text(
                              snapshot.data[index].contact,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1264D1),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Text("hello");
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

class NewUser {
  final String name;
  final String email;
  final String location;
  final String designation;
  final String contact;

  NewUser(
    this.name,
    this.email,
    this.location,
    this.designation,
    this.contact,
  );
}

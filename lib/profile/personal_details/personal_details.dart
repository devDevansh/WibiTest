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
      if (u["email"] == userEmail) {
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
        title: Text(
          "Personal Details",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        margin: EdgeInsets.only(
          top: 200,
          bottom: 200,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 10.0,
              offset: Offset(0.0, -4.0),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
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
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Name :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              width: getProportionateScreenWidth(198),
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
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Email :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              width: getProportionateScreenWidth(200),
                              child: Text(
                                userEmail,
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
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Designation :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              width: getProportionateScreenWidth(140),
                              child: Text(
                                snapshot.data[index].designation,
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
                          bottom: getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Location :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF546E7A),
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              child: Text(
                                snapshot.data[index].location,
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
                          bottom: getProportionateScreenWidth(25),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Contact :',
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
              return SizedBox(
                height: getProportionateScreenHeight(580),
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
                  ),
                ),
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

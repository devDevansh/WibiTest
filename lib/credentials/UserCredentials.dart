import 'dart:convert';
import 'package:WIBI/home/home_screen.dart';
import 'package:WIBI/login/LoginScreen.dart';

import '../UserDetails.dart';
//import '../home_screen.dart';
//import './home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'UserCredentials_design.dart';
//import 'UserDetail.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    super.dispose();
  }

  String name, email, phone, designation, _currentSelectedItem;
  String username, useremail, usercontact, userlocation, userdesignation;

  List<String> _locations = [
    'Main Building',
    'CCD Building',
    'SVC Building',
    'Roush Building',
    'Pasta Street Building',
  ];
  String _dropdownError;

  //TextEditingController password = TextEditingController();
  //TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void postIntoDB(Map data) async {
    print(data);
    var encodedData = jsonEncode(data);
    await post("http://10.0.2.2:8080/users", body: encodedData);
  }

  _validateForm() {
    bool _isValid = _formkey.currentState.validate();
    if (_currentSelectedItem == null) {
      setState(() => _dropdownError = '');
      _isValid = false;
    }

    if (_isValid) {
      print("Printing entered user details \n");
      print(username);
      print(useremail);
      print(usercontact);
      print(userlocation);
      print(userdesignation);
      UserDetail newUser = new UserDetail(
          username, useremail, userdesignation, userlocation, usercontact);
      Map data = newUser.mappedjson();
      postIntoDB(data);
      // route to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
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
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Sign Up",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                /*  Row(
                  children: [ 
                     Stack(
                      children: [
                        SizedBox(height: 100, width: 135),
                        RawMaterialButton(
                          onPressed: () {},
                          fillColor: Color(0xFFF2F2F0),
                          child: Icon(
                            Icons.arrow_left_rounded,
                            size: 40.0,
                          ),
                          shape: CircleBorder(),
                        )
                      ],
                    ), */
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        blurRadius: 6.0,
                        offset: Offset(4.0, 4.0),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF1264D1),
                    radius: 60,
                    child: Container(
                      alignment: Alignment(0.4, 0.15),
                      child: Image.asset(
                        'assets/images/details.png',
                        height: 75,
                        width: 75,
                        fit: BoxFit.scaleDown,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: myController1,
                    decoration:
                        buildInputDecoration(Icons.person_rounded, 'Full Name'),
                    validator: (String value) {
                      // this is the validation part that is displayed on the bottom of the text feild
                      if (value.isEmpty) {
                        return 'Please enter your name!';
                      } else if (value.length < 3) {
                        return 'Name must be more than 2 characters!';
                      } else {
                        username = myController1.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      print(value);
                      name = value;
                      username = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    controller: myController2,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.email_rounded, 'Email'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter you email id!';
                      }
                      if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                          .hasMatch(value)) {
                        return 'Please enter a valid email id!';
                      } else {
                        useremail = myController2.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      email = value;
                      useremail = email;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    controller: myController3,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.work_rounded, 'Designation'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your designation!';
                      } else {
                        userdesignation = myController3.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      designation = value;
                      userdesignation = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 328,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F0),
                          border: Border.all(
                            width: 1.5,
                            color: Color(0xFFF2F2F0),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Color(0xFFF2F2F0),
                              buttonTheme: ButtonTheme.of(context).copyWith(
                                alignedDropdown: true,
                              )),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 30,
                                color: Color(0xFF342E37),
                              ),
                              isExpanded: true,
                              items: _locations.map(
                                (val) {
                                  return DropdownMenuItem(
                                    value: val,
                                    child: Align(
                                      alignment: Alignment(-0.8, -0.1),
                                      child: Text(
                                        val,
                                        style: TextStyle(
                                          color: Color(0xFF342E37),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              hint: Align(
                                alignment: Alignment(-0.78, -0.25),
                                child: Text(
                                  'Location',
                                ),
                              ),
                              value: _currentSelectedItem,
                              onChanged: (value) {
                                setState(() {
                                  _currentSelectedItem = value;
                                  userlocation = value;
                                  _dropdownError = null;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      _dropdownError == null
                          ? SizedBox.shrink()
                          : Text(
                              _dropdownError,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                      Container(
                        margin: EdgeInsets.only(top: 14.0, left: 11.0),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFF342E37),
                          size: 26.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    controller: myController4,
                    keyboardType: TextInputType.number,
                    decoration:
                        buildInputDecoration(Icons.phone_rounded, 'Contact'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your contact!';
                      } else if (value.length != 10) {
                        return 'Contact must be of 10 digits!';
                      } else {
                        usercontact = myController4.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      phone = value;
                      usercontact = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 6.0,
                          offset: Offset(4.0, 4.0),
                        ),
                      ],
                    ),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      splashColor: Colors.white,
                      color: Color(0xFF1264D1),
                      onPressed: () {
                        _validateForm();

                        /* if (_formkey.currentState.validate()) {
                          print("successful");

                          return;
                        } else {
                          print("UnSuccessfull");
                        } */
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      textColor: Colors.white,
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

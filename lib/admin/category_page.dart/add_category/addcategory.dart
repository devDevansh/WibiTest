import 'dart:convert';

import 'package:WIBI/admin/account_page.dart/add_account/add_account_design.dart';
import 'package:WIBI/admin/category_page.dart/categorypage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final myController1 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    super.dispose();
  }

  String category;
  String categorytitle;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void postIntoDB(Map data) async {
    print(data);
    var encodedData = jsonEncode(data);
    await post("http://10.0.2.2:8080/category", body: encodedData);
  }

  _validateForm() {
    bool _isValid = _formkey.currentState.validate();

    if (_isValid) {
      Category catg = new Category(categorytitle);
      Map data = catg.mappedjson();
      postIntoDB(data);
      // route to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ManageCategories(),
        ),
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
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => ManageCategories()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Add Category",
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
                SizedBox(height: 10),
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
                      child: Image.asset(
                        'assets/images/add.png',
                        height: 75,
                        width: 75,
                        fit: BoxFit.scaleDown,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: myController1,
                    decoration: buildInputDecoration(
                        Icons.category_rounded, 'Category'),
                    validator: (String value) {
                      // this is the validation part that is displayed on the bottom of the text field
                      if (value.isEmpty) {
                        return 'Please enter the category!';
                      } else if (value.length < 2) {
                        return 'Category must be more than 1 character!';
                      } else {
                        categorytitle = myController1.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      print(value);
                      category = value;
                      categorytitle = value;
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
                SizedBox(height: 290)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Category {
  String category;

  Category(String category) {
    this.category = category;
  }

  Map mappedjson() {
    Map data = {
      "category": this.category,
    };
    return data;
  }
}

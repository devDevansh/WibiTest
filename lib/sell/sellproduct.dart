import 'dart:convert';
//import 'dart:io';
import 'package:WIBI/home/home_screen.dart';
import 'package:WIBI/sell/Image%20Upload/imageupload.dart';
import 'package:WIBI/variables.dart';
import 'package:flutter/material.dart';

import 'sellproduct_design.dart';
import 'package:http/http.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  //PickedFile _imageFile;
  //ImagePicker _picker = ImagePicker();
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

  String title,
      description,
      expectedprice,
      _currentSelectedItem,
      _currentSelectItem;
  List<String> _locations = [
    'Main Building',
    'CCD Building',
    'SVC Building',
    'Roush Building',
    'Pasta Street Building',
  ];
  List<String> _categories = [
    'Electronics',
    'Furniture',
    'Books',
    'Appliances',
    'Vehicles',
  ];
  String _dropdownError;

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void postIntoDB(Map data) async {
    print(data);

    var encodedData = jsonEncode(data);
    await post("http://10.0.2.2:8080/products", body: encodedData);
    await post("http://10.0.2.2:8080/notification", body: encodedData);
  }

  _validateForm() {
    bool _isValid = _formkey.currentState.validate();
    if (_currentSelectedItem == null) {
      setState(() => _dropdownError = '');
      _isValid = false;
    }

    if (_isValid) {
      print("Printing entered product details \n");
      print(title);
      print(description);
      print(int.parse(expectedprice));
      print(_currentSelectedItem);
      print(_currentSelectItem);
      /*    ProductDetails newProduct = new ProductDetails("Dummy", "id", "asd",
          "cat", "_currentSelectedItem", 1000, "_currentSelectItem", "123"); */
      //Map data = newProduct.mappedjson();
      Map data = {
        "id": "id",
        "title": title,
        "category": _currentSelectItem,
        "location": _currentSelectedItem,
        "image": "img",
        "price": int.parse(expectedprice),
        "description": description,
        "date": "date",
        "issold": "no",
        "email": userEmail,
      };
      print("Log");
      // print(data);
      postIntoDB(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left_rounded,
            size: 40.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Sell Product",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 5),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
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
                              'assets/images/product.png',
                              height: 75,
                              width: 75,
                              fit: BoxFit.scaleDown,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
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
                            radius: 16,
                            backgroundColor: Color(0xFFF2F2F0),
                            child: IconButton(
                              icon: Icon(
                                Icons.photo_camera_rounded,
                                size: 15.0,
                              ),
                              color: Color(0xFF342E37),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => ImageCapture(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //   imageProfile(),
                /*      bottomSheet(),
                child: CircleAvatar(
                backgroundColor: Color(0xFF1264D1),
                radius: 60,
                backgroundImage: NetworkImage(""),
                child: Image.asset(
                      'assets/images/details.png',
                      height: 70,
                      width: 70,
                      fit: BoxFit.scaleDown,
                      color: Colors.white,
                    ),

                ), */
                SizedBox(
                  height: 25,
                ),
                /*Text(
                  'Tell us a little about yourself!',
                  style: TextStyle(
                    color: Color(0xFF342E37),
                    fontSize: 15.0,
                  ),
                ),*/
                /*  SizedBox(
                  height: 20,
                ), */
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: myController1,
                    decoration: buildInputDecoration(
                        Icons.text_fields_rounded, 'Product Title'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter the product title!';
                      } else if (value.length < 3) {
                        return 'Title must be more than 2 characters!';
                      } else {
                        title = myController1.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      print(value);
                      title = value;
                      title = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: myController2,
                    decoration: buildInputDecoration(
                        Icons.wysiwyg_rounded, 'Product Description'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter the product description!';
                      } else if (value.length < 3) {
                        return 'Description must be more than 2 characters!';
                      } else {
                        description = myController2.text;
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      description = value;
                      description = value;
                    },
                    /*validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter you email id!';
                      }
                      if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                          .hasMatch(value)) {
                        return 'Please enter a valid email id!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      email = value;
                    },*/
                  ),
                ),
                /*    SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 21,
                ), */
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
                              items: _categories.map(
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
                                  'Category',
                                ),
                              ),
                              value: _currentSelectItem,
                              onChanged: (value) {
                                setState(() {
                                  _currentSelectItem = value;
                                  _currentSelectItem = value;
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
                          Icons.category_rounded,
                          color: Color(0xFF342E37),
                          size: 26.0,
                        ),
                      ),
                    ],
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
                                  _currentSelectedItem = value;
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

                /*Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        buildInputDecoration(Icons.phone_rounded, 'Contact'),*/
                /*validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your contact!';
                      } else if (value.length != 10) {
                        return 'Contact must be of 10 digits!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      phone = value;
                    },
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),*/
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    controller: myController3,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(
                        Icons.local_offer_rounded, 'Expected Price'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your expected price!';
                      } else {
                        expectedprice = myController3.text;
                        return null;
                      }
                      /*else if (value.length <= 0) {
                        return 'expected must be of atleast 1 digit!';*/
                    },
                    //return null;
                    //},
                    onSaved: (String value) {
                      expectedprice = value;
                      expectedprice = value;
                    },
                    /*validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your designation!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },*/
                  ),
                ),
                SizedBox(
                  height: 18,
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
                        /*      postIntoDB({
                          "title": myController1.text,
                          "description": myController2.text,
                          "expectedprice": myController3.text,
                          "category": _currentSelectItem,
                          "location": _currentSelectedItem,
                        }); */
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      textColor: Colors.white,
                      child: Text(
                        'POST',
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

/* Widget imageProfile() {
  return Center(
    child: Stack(children: <Widget>[
      CircleAvatar(
        radius: 80.0,
        backgroundImage: _imageFile == null
            ? AssetImage("assets/profile.png")
            : FileImage(File(_imageFile.path)),
      ),
      Positioned(
        bottom: 20.0,
        right: 20.0,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => bottomSheet()),
            );
          },
          child: Icon(
            Icons.camera_alt,
            color: Colors.black,
            size: 28.0,
          ),
        ),
      ),
    ]),
  );
} */

/*   Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      print("Image file is" + _imageFile.toString());
    });
  }
}
 */
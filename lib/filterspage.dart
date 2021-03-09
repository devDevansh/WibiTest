import 'package:flutter/material.dart';

import 'catelements.dart';
import 'date.dart';
import 'price.dart';

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: hello(),
  ));
}*/

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('FILTERS')),
      body: ListView(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          SafeArea(
            child: FlatButton(
              onPressed: () {}, //{
              /*  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Elements()));
              }, */
              splashColor: Colors.black,
              child: Card(
                color: Colors.grey,
                margin: EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        //child: Image.asset('assets/images/listpng'),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Center(
                          child: Text(
                        'by Categories',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
          SafeArea(
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Price()));
              },
              splashColor: Colors.black,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        //child: Image.asset('assets/images/price-tag.png'),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Center(
                          child: Text(
                        'by Price',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
          SafeArea(
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Date()));
              },
              splashColor: Colors.black,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        //child: Image.asset('assets/images/calendar.png'),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Center(
                          child: Text(
                        'by Listing Date',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
        ],
      ),
    ));
  }
}

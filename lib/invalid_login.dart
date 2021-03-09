import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Hello extends StatelessWidget {
  final GoogleSignIn _gSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.network(
                          'https://c.tenor.com/OYt3g541tDYAAAAi/cute-lovely.gif'),
                    ),
                    Text(
                      'Sorry.... :( ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Access Restricted',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'This app is restricted to Nineleaps family only..',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10.0),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        _gSignIn.signOut();
                        print('Invalid user Signed out');
                        Navigator.pop(context);
                      },
                      child: Text('Return back'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

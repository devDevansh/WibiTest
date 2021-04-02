import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

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
                    child: Lottie.asset(
                      'assets/lottie/invalid.json',
                    ),
                  ),
                  Text(
                    'Oops!',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Color(0xFF1264D1),
                      fontFamily: 'Visby Round',
                    ),
                  ),
                  const SizedBox(height: 70.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Wibi!',
                        style: TextStyle(
                          fontFamily: 'Grilled Cheese',
                          fontSize: 16,
                          color: Color(0xFF1264D1),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'is exclusive to NINELEAPS personnel only.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF546E7A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Please sign in with your NINELEAPS ID to continue.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF546E7A),
                    ),
                  ),
                  const SizedBox(height: 150.0),
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
                          _gSignIn.signOut();

                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        textColor: Colors.white,
                        child: Text(
                          'RETURN',
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
          ],
        ),
      ),
    );
  }
}

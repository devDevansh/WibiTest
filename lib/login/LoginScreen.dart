import 'dart:convert';

//import 'package:WIBI/UserCredentials.dart';
import 'package:WIBI/credentials/UserCredentials.dart';
import 'package:WIBI/home/home_screen.dart';
import 'package:WIBI/variables.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
//import 'LoginPage.dart';
//import '../home_screen.dart';
//import '../invalid_login.dart';
import 'invalid_login.dart';
//import './invalid_login.dart';
//import 'home_screen.dart';

//void main() => runApp(MyApp());

class LoginScreen extends StatelessWidget {
  // static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wibi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1264D1),
        fontFamily: 'Product Sans',
      ),
      home: GoogleSignApp(),
    );
  }
}

class GoogleSignApp extends StatefulWidget {
  // static String routeName = "/login";
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    /*  Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    )); */

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    // ignore: deprecated_member_use
    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );

    userEmail = userDetails.email;
    userName = userDetails.displayName;

    /*  Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ProfileScreen(detailsUser: details),
      ),
    ); */
    if (userDetails.email.endsWith("@gmail.com")) {
      //get user details from back end
      //check for each user in the list if userDetails.email is present in the list
      var response = await get("http://10.0.2.2:8080/users");
      var userDecode = jsonDecode(response.body);
      bool isPresent = false;

      for (var u in userDecode) {
        if (u["email"] == userDetails.email) {
          isPresent = true;
          popValid = true;
          break;
        }
      }
      if (isPresent == false) {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new FormPage(),
          ),
        );
      } else {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new HomeScreen(),
          ),
        );
      }
    } else {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new Hello(),
        ),
      );
    }
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 110),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 170,
                    width: 170.0,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Wibi!',
                    style: TextStyle(
                      fontSize: 65,
                      fontFamily: 'Grilled Cheese',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1264D1),
                    ),
                  ),
                  Text(
                    'Wish it Buy it!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1A237E),
                      fontFamily: 'Grilled Cheese',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 200),
                  Container(
                    width: 280.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF4285F4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 6.0,
                          offset: Offset(4.0, 4.0),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.white,
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset(
                            "assets/images/search.svg",
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              color: Color(0xFF4285F4),
                              width: 231.0,
                            ),
                            Container(
                              height: 45.0,
                              width: 231.0,
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                splashColor: Colors.white,
                                onPressed: () => _signIn(context)
                                    .then((FirebaseUser user) => print(user))
                                    .catchError((e) => print(e)),
                                color: Color(0xFF4285F4),
                                child: Center(
                                  child: Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}

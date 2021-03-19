import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/default_button.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:WIBI/login/LoginScreen.dart';
//import 'package:WIBI/login/LoginScreen.dart';
import 'package:flutter/material.dart';
//import 'package:WIBI/constants.dart';
//import 'package:WIBI/screens/sign_in/sign_in_screen.dart';
//import 'package:WIBI/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
//import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Wibi!",
      "animation": "assets/lottie/lottiefile1.json",
    },
    {
      "text": "We are a NINELEAPS Exclusive Marketplace!",
      "animation": "assets/lottie/lottiefile2.json",
    },
    {
      "text": "Wish it Buy it! simple, right?",
      "animation": "assets/lottie/lottiefile3.json",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  animation: splashData[index]["animation"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    DefaultButton(
                      text: "CONTINUE",
                      press: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFF90CAF9),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

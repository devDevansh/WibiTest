import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//import '../../../constants.dart';
//import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.animation,
  }) : super(key: key);
  final String text;
  final String animation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 3),
        Text(
          "Wibi!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(50),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: "Grilled Cheese",
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Lottie.asset(
          animation,
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(340),
        ),
      ],
    );
  }
}

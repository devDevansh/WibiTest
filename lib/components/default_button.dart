import 'package:WIBI/components/constants.dart';
import 'package:WIBI/components/size_config.dart';
import 'package:flutter/material.dart';

/* import '../constants.dart';
import '../size_config.dart';
 */
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(250),
      height: getProportionateScreenHeight(56),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: kPrimaryColor,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

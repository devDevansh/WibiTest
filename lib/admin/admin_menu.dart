import 'package:WIBI/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(20),
        vertical: getProportionateScreenHeight(12),
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        height: getProportionateScreenHeight(50),
        padding: EdgeInsets.only(
          top: getProportionateScreenHeight(30),
          bottom: getProportionateScreenHeight(30),
          left: getProportionateScreenHeight(20),
          right: getProportionateScreenHeight(20),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Color(0xFFF2F2F0),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Color(0xFF342E37),
              width: 40,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Icon(
              Icons.arrow_right_rounded,
              size: 40,
              color: Color(0xFF342E37),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              radius: 60,
              child: Image.asset(
                "assets/images/admin profile.png",
                height: 70,
                width: 70,
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

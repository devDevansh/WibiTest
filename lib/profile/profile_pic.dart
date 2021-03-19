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
        overflow: Overflow.visible,
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
              backgroundImage: AssetImage('assets/images/profile.png'),
              //radius: 60,
              /* child: Image.asset(
                "assets/images/user profile.png",
                height: 70,
                width: 70,
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ), */
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
                  color: Color(0xFF263238),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:WIBI/profile/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left_rounded,
            size: 40.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => SettingsScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          "Donate",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Product still unsold?',
                style: TextStyle(
                  color: Color(0xFF546E7A),
                  fontFamily: 'Visby Round',
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Be a helping hand instead!',
                style: TextStyle(
                  color: Color(0xFF1264D1),
                  fontFamily: 'Visby Round',
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  'Visit following links to donate your products',
                  style: TextStyle(
                    color: Color(0xFF546E7A),
                    fontFamily: 'Visby Round',
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  'to someone needy of them.',
                  style: TextStyle(
                    color: Color(0xFF546E7A),
                    fontFamily: 'Visby Round',
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 90),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  SvgPicture.asset(
                    "assets/images/donate.svg",
                    color: Color(0xFF342E37),
                    width: 33,
                    height: 33,
                  ),
                  SizedBox(width: 9),
                  InkWell(
                    child: new Text(
                      'DonateInKind',
                      style: TextStyle(
                        color: Color(0xFF1264D1),
                        fontFamily: 'Visby Round',
                        fontSize: 25,
                      ),
                    ),
                    onTap: () => launch('http://www.donateinkind.in/index.php'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 70),
                  SvgPicture.asset(
                    "assets/images/donate.svg",
                    color: Color(0xFF342E37),
                    width: 33,
                    height: 33,
                  ),
                  SizedBox(width: 9),
                  InkWell(
                    child: new Text(
                      'SevaDeep',
                      style: TextStyle(
                        color: Color(0xFF1264D1),
                        fontFamily: 'Visby Round',
                        fontSize: 25,
                      ),
                    ),
                    onTap: () => launch('https://sevadeep.com/'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 70),
                  SvgPicture.asset(
                    "assets/images/donate.svg",
                    color: Color(0xFF342E37),
                    width: 33,
                    height: 33,
                  ),
                  SizedBox(width: 9),
                  InkWell(
                    child: new Text(
                      'Social Help Care',
                      style: TextStyle(
                        color: Color(0xFF1264D1),
                        fontFamily: 'Visby Round',
                        fontSize: 25,
                      ),
                    ),
                    onTap: () =>
                        launch('https://socialhelpcare.org/donate-used-stuff/'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 70),
                  SvgPicture.asset(
                    "assets/images/donate.svg",
                    color: Color(0xFF342E37),
                    width: 33,
                    height: 33,
                  ),
                  SizedBox(width: 9),
                  InkWell(
                    child: new Text(
                      'SADS India',
                      style: TextStyle(
                        color: Color(0xFF1264D1),
                        fontFamily: 'Visby Round',
                        fontSize: 25,
                      ),
                    ),
                    onTap: () => launch('https://sadsindia.org/'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 70),
                  SvgPicture.asset(
                    "assets/images/donate.svg",
                    color: Color(0xFF342E37),
                    width: 33,
                    height: 33,
                  ),
                  SizedBox(width: 9),
                  InkWell(
                    child: new Text(
                      'DonateKart',
                      style: TextStyle(
                        color: Color(0xFF1264D1),
                        fontFamily: 'Visby Round',
                        fontSize: 25,
                      ),
                    ),
                    onTap: () => launch('https://www.donatekart.com/'),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Text(
                "Wibi!",
                style: TextStyle(
                  color: Color(0xFF1264D1),
                  fontFamily: 'Grilled Cheese',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:WIBI/profile/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
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
          "Help",
        ),
        backgroundColor: Color(0xFF1264D1),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Screen 1',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/2.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Login Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 2',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/3.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Credentials Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 3',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/4.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Home Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 4',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/5.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Search Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 5',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/6.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Filters Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 6',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/7.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Wishlist Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 7',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/8.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Notification Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 8',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/9.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Details Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 9',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/10.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Sell Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 10',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/11.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Profile Screen",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Screen 11',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/screens/12.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Text(
              "Admin Panel",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Visby Round',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Navigations',
              style: TextStyle(
                color: Color(0xFF546E7A),
                fontFamily: 'Visby Round',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 100),
            Image.asset(
              'assets/screens/1.jpg',
              width: 500,
              height: 300,
            ),
            SizedBox(height: 70),
            Text(
              "Wibi!",
              style: TextStyle(
                color: Color(0xFF1264D1),
                fontFamily: 'Grilled Cheese',
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
          ],
        )),
      ),
    );
  }
}

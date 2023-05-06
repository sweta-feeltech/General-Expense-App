import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/constants.dart';
import '../Dashboard/bottom_bar.dart';
import '../Dashboard/bottom_navbar_screen.dart';
import '../Dashboard/home_screen.dart';
import 'main_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // User is already logged in, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomBar()),
      );
    } else {
      // User is not logged in, show login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPageScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 150,
            width: 150,
            child: Image.asset("assets/images/g.png")),
      ),
    );
  }
}
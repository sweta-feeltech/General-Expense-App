import 'package:flutter/material.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/colors.dart';
import '../Widgets/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logout() async {
    // Sign out the user from Firebase, if applicable
    // ...

    // Remove login status from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');

    // Navigate back to login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryGrey,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          onPressed: () {
            // widget.backPressCallback.call();
            // Navigator.of(context).pop();
          },
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
        titleSpacing: 0,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryGrey,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            logout();
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}

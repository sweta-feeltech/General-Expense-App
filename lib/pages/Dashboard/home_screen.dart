import 'package:flutter/material.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
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
    return Scaffold(

      appBar: AppBar(

        title: Text("Dashboard"),
      ),

      body: Center(
        child: ElevatedButton(onPressed: (){
          logout();
        },

          child: Text("Logout"),
        ),
      ),



    );
  }
}

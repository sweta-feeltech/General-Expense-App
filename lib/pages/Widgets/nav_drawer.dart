import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Dashboard/category_screen.dart';
import '../LoginRegistrationScreens/splash_screen.dart';

class NavDrawer extends StatefulWidget {
  static String routeName = 'navDrawer';
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

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

      backgroundColor: Colors.white,
      body: Column(
        children: [

          SizedBox(
            height: 100,
          ),
          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),


          InkWell(
            onTap: () {

              logout();
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen(
              //         (){
              //     }
              // )));
              print("donations press");
              // Navigator.of(context, rootNavigator: true).pushNamed(NavFundraiserFormScreen.routeName);
            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Logout", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),



          InkWell(
            onTap: () {

              Navigator.of(context, rootNavigator: true).pushNamed(CategoryScreen.routeName);
            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.roofing,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("category", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),







        ],
      ),


    );
  }
}

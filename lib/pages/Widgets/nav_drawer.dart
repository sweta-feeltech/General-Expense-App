import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Dashboard/add_expense_screen.dart';
import 'package:general_expense_app/pages/Dashboard/items_screen.dart';
import 'package:general_expense_app/pages/Dashboard/room_screen.dart';
import 'package:general_expense_app/pages/Dashboard/shelf_screen.dart';
import 'package:general_expense_app/pages/Group/group_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/constants.dart';
import '../Dashboard/add_home_Screen.dart';
import '../Dashboard/category_screen.dart';
import '../Income_Expense/income_screen.dart';
import '../LoginRegistrationScreens/main_screen.dart';
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
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SplashScreen()), (route) => false);

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


          ///
          ///
          /// FOR CATEGORY CARDS
          ///
          ///
          InkWell(
            onTap: () {

              Navigator.of(context, rootNavigator: true).pushNamed(CategoryScreen.routeName);
            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.add_card_outlined,
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

          ///
          ///
          /// FOR GROUPS
          ///
          ///
          InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(GroupListScreen.routeName);
            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.group,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Groups", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),


          ///
          ///
          /// FOR INCOME
          ///
          ///
          InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(ListofIncomeScreen.routeName);
            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.money_sharp,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Add Income", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),



          ///
          ///
          /// FOR HOME
          ///
          ///
          InkWell(
            onTap: () {

              Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>AddExpenseScreen()));

            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.monetization_on_outlined,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Add Expense", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),


          ///
          ///
          /// FOR HOME
          ///
          ///
          InkWell(
            onTap: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddHomeScreen()));

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
                  Text("Add Home", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),


          ///
          ///
          /// FOR ROOM
          ///
          ///
          InkWell(
            onTap: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RoomScreen((){})));

            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.add_business_outlined,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Add Room", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),



          ///
          ///
          /// FOR SHELF
          ///
          ///
          InkWell(
            onTap: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShelfScreen()));

            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.add_card_sharp,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Add Shelf", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),



          ///
          ///
          /// FOR ITOMS
          ///
          ///
          InkWell(
            onTap: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemScreen()));

            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.add_box_outlined,
                      color: primaryPurple,
                    ),
                    // child: SvgPicture.asset("assets/icons/donation_icon.svg", width: 20, height: 20,),
                  ),
                  SizedBox(width: 10,),
                  Text("Add Items", style: TextStyle(fontSize: main_Height * 0.018, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),


          Divider(thickness: 1, height: 0,indent: 15, endIndent: 15,),



          ///
          ///
          /// FOR LOGOUT
          ///
          ///

          InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('accessSession');
              accessToken = null;
              appUserData = null;
              Navigator.of(context,rootNavigator: true)
                  .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MainPageScreen()), (route) => false);
            },
            child: ListTile(
              title: Row(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.logout_rounded,
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



        ],
      ),


    );
  }
}

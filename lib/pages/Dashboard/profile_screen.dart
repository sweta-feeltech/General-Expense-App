import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Dashboard/inventory_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/constants.dart';
import 'dart:math' as math;
import '../LoginRegistrationScreens/splash_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = 'profileScreen';
  Function backPressCallback;

  ProfileScreen(this.backPressCallback,{super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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

      body: WillPopScope(
        onWillPop: () async{
          widget.backPressCallback.call();
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {

          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  centerTitle: false,
                  titleSpacing: 15,
                  backgroundColor: primaryPurple,
                  // elevation: 10,
                  // leading:   IconButton(
                  //   padding: EdgeInsets.zero,
                  //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
                  //   onPressed: () {
                  //     widget.backPressCallback.call();
                  //   },
                  //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                  // ),
                  title:  Text("Profile",
                    style:
                    TextStyle(color: Colors.white, fontSize: main_Height * 0.025),),

                ),
                const Divider(thickness: 0.1,height: 0.1, indent: 0, endIndent: 0,color: primaryGrey,),
                Container(
                  decoration: const BoxDecoration(
                      color: primaryPurple
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryGrey,
                              ),
                              child: ClipOval(
                                child: Material(
                                    child: Container(
                                      height: main_Height * 0.06,
                                      width: main_Height * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image:
                                          const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.png"),
                                            fit: BoxFit.cover,

                                          )

                                      ),
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              width: main_Height * 0.015,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: main_Width * 0.4,
                                  // child: Text("${widget.fname == "" ? appUserData!.firstName : widget.fname} ${widget.lname == "" ? appUserData!.lastName : widget.lname}",
                                  child: Text("User Name",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: main_Height * 0.0218,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: ElevatedButton(onPressed: () async {

                            String refresh = await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                builder: (context) => EditProfileScreen((){})));
                            if(refresh == "refresh"){
                            }
                          },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Text("Edit Profile",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: main_Height * 0.015,
                                  color: primaryPurple,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          Text("Account Settings ",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: main_Height * 0.019,
                              // fontSize: main_Height * 0.04,
                              fontWeight: FontWeight.w600,
                              color: darkGrey,
                            ),
                          )
                        ],
                      ),
                    ),


                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [

                          ListTile(
                            onTap: () async{

                              String refresh = await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                  builder: (context) => EditProfileScreen((){})));

                              if(refresh == "refresh"){
                              }
                            },
                            title: Row(
                              children:  [
                                const SizedBox(width: 2),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.person,color: primaryPurple,),
                                ),
                                SizedBox(width: main_Height * 0.020,),
                                Text("My Profile", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),

                          const Divider(thickness: 1,height: 0, indent: 20, endIndent: 20),

                          ListTile(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InventoryScreen((){})));
                            },
                            title: Row(
                              children:  [
                                SizedBox(width: 2),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.book_outlined,color: primaryPurple,),
                                ),
                                SizedBox(width: main_Height * 0.020,),
                                Text("Inventory", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          const Divider(thickness: 1,height: 0, indent: 20, endIndent: 20),

                          ListTile(
                            onTap: (){
                              logout();
                            },
                            title: Row(
                              children:  [
                                SizedBox(width: 20,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Transform(
                                      transform:Matrix4.rotationY(math.pi),
                                      child: const Icon(Icons.logout,
                                    color: primaryPurple,
                                  ),
                                  )
                                ),
                                Text("Logout", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ),

      ),

    );
  }
}

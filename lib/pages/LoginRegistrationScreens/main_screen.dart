import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Utils/colors.dart';
import '../../Utils/constants.dart';
import '../Dashboard/bottom_nav_bar.dart';
import 'login_screen.dart';
// import '../Dashboard/botton_bar_1.dart';



class MainPageScreen extends StatefulWidget {
  static String routeName = '/mainScreen';
  const MainPageScreen({Key? key}) : super(key: key);


  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {


  bool _isLoading = false;


  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    // Perform login authentication
    await Future.delayed(Duration(seconds: 2));

    // Save login status to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: main_Height * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: main_Height * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: primaryOrange),
                            ),
                            Text(
                              " to start again",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: main_Height * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "authentic information",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: main_Height * 0.028,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Please create an account or log in to access more \naunthenthic information",
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: main_Height * 0.0155,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
              ],
            ),


              Container(
                width: main_Width * 0.75,
                height: main_Height * 0.30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/cover.png",),
                        fit: BoxFit.fill
                    )
                ),
              ),

                SizedBox(
                  height: main_Height * 0.02,
                ),

                Container(
                  height: main_Height * 0.18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: main_Height * 0.060,
                    width: main_Width * 0.9,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        side: BorderSide(
                            style: BorderStyle.none
                        ),
                        backgroundColor: primaryPurple,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            RegistrationScreen.routeName);


                      },
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                            fontSize: main_Height < 700 ? 12 : 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                          thickness: 1,
                          indent: 55,
                          endIndent: 15,
                          color: Color.fromARGB(100, 0, 0, 0),
                        )
                    ),

                    Text("or",
                      style: TextStyle(
                          fontSize: main_Height < 700 ? 12 : 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(100, 0, 0, 0)
                      ),
                    ),

                    Expanded(
                        child: Divider(
                          color: Color.fromARGB(100, 0, 0, 0),
                          thickness: 1,
                          indent:15,
                          endIndent: 55,
                        )
                    ),
                  ]
              ),

              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: main_Height * 0.060,
                  width: main_Width * 0.9,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      side: BorderSide(
                          style: BorderStyle.none
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInScreen()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: main_Height < 700 ? 12 : 15,
                          fontWeight: FontWeight.w500,
                          color: primaryPurple),
                    ),
                  ),
                ),
              ),
            ],
          ),
                ),

              Container()

              //
              // Center(child:
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //        Text(
              //         "Already have an account ?",
              //         style: TextStyle(
              //           fontSize: main_Height * 0.0165,
              //           color: Colors.black,),
              //         textAlign: TextAlign.center,
              //       ),
              //       TextButton(
              //         onPressed: () => {
              //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInScreen()))
              //         },
              //         child:  Text(
              //           "Log In",
              //           style: TextStyle(
              //             fontSize: main_Height * 0.0165,
              //             // color: Color(0xFFFF7622),
              //             color: primaryPurple,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // )

            ],
          ),
        ),
      ),

    );
  }
}

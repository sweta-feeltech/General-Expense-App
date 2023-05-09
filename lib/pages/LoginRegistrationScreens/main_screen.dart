import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/registration_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Utils/colors.dart';
import '../../Utils/constants.dart';
import '../Dashboard/bottom_bar.dart';
// import '../Dashboard/botton_bar_1.dart';



class MainPageScreen extends StatefulWidget {
  static String routeName = '/mainScreen';
  const MainPageScreen({Key? key}) : super(key: key);


  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                                fontSize: main_Height * 0.030,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "authetic information",
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
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Please create an account or log in to access more \naunthethic information",
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
              SizedBox(height: 80,),
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
              SizedBox(height: 100,),
              SizedBox(
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
                    "Create Account",
                    style: TextStyle(
                        fontSize: main_Height < 700 ? 12 : 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Or Signin With Google",
                      style: TextStyle(
                          fontSize: main_Height < 700 ? 12 : 14,
                          // fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),

                   ]
              ),
              SizedBox(height: 10,),

              Center(
                child:Container(
                  height: main_Height * 0.085,
                  width: main_Width * 1,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: 10),
                    child: Container(
                      height: main_Height * 0.06,
                      width: main_Width * 0.75,
                      decoration: BoxDecoration(
                        color: primaryPurple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.white,
                        ),
                        onPressed: () {

                          _googleSignIn.signIn().then((value) {

                            try{
                              setState(() {

                                login();

                                String username = value!.displayName!;
                                String? email = value.email;
                                String? serviceAuth = value.serverAuthCode;
                                String? profilePicture = value.photoUrl;
                                String? id = value.id;
                                print("serviceAuth;   $serviceAuth");
                                print("id;   $id");
                                print("profile;   $profilePicture");
                                print("profile;   $profilePicture");
                                // print("profile;   $profilePicture");
                                // print("profile;   $profilePicture");

                                AuthorizedUser = true;

                                Username = username;
                                Email  = email;
                                ServiceAuth = serviceAuth;
                                ProfilePicture = profilePicture;
                                ID = id;



                              }
                              );

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomBarScreen()));
                            }catch(e){
                              print(" ${e}");
                            }

                          });



                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [


                                Container(
                                  height: main_Height * 0.04,
                                  width: main_Height * 0.04,
                                  child: Image.asset("assets/images/g.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),


                                Text("Google",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: main_Height * 0.018,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: main_Height * 0.060,
              //   width: main_Width * 0.9,
              //   child: OutlinedButton(
              //     child: Text(
              //       "Login with OTP",
              //       style: TextStyle(
              //           fontSize: main_Height < 700 ? 12 : 15,
              //           fontWeight: FontWeight.w700,
              //           color: Colors.white),
              //     ),
              //
              //     style: OutlinedButton.styleFrom(
              //       padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30)
              //       ),
              //       side: BorderSide(
              //           style: BorderStyle.none
              //       ),
              //       backgroundColor: primaryPurple,
              //     ),
              //     onPressed: () {
              //       ////
              //       // Here, we are assigning true to IsGuest Because This Button will be pressed before login so it will be consider as a guest.
              //       ////
              //       // IsGuest = true;
              //       // // StartStepperPage = true;
              //       //
              //       // // Navigator.pushNamed(context, FundraiserStepperPage.routeName);
              //       // Navigator.of(context).pushNamed(NewFundraiserStepperPage.routeName);
              //     },
              //   ),
              // ),
              SizedBox(height: 10,),

              Center(child:
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationScreen()))
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 14,
                          // color: Color(0xFFFF7622),
                          color: primaryPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              )

            ],
          ),
        ),
      ),

    );
  }
}

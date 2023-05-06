import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Utils/constants.dart';
import '../Dashboard/bottom_navbar_screen.dart';
import '../Dashboard/home_screen.dart';



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

    // Navigate to home screen
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }


  String? _profilePicture;
  // String? _username;


  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;



    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/wall.png",
                  ),
                  fit: BoxFit.fill
              )
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.white,
                        ),
                        onPressed: () {

                          _googleSignIn.signIn().then((value) {

                            try{
                              setState(() {

                                login();

                                String username = value!.displayName!;
                                String? email = value!.email;
                                String? serviceAuth = value!.serverAuthCode;
                                String? profilePicture = value.photoUrl;
                                String? id = value!.id;
                                print("profile;   $profilePicture");

                                AuthorizedUser = true;

                                Username = username;
                                Email  = email;
                                ServiceAuth = serviceAuth;
                                ProfilePicture = profilePicture;
                                ID = id;



                              }
                              );

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavbarScreen()));
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


                                Text("Login with Google",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: main_Height * 0.018,
                                      fontWeight: FontWeight.w700,
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

              Center(child:
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () => {


                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 18,
                          // color: Color(0xFFFF7622),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:general_expense_app/models/ProfileModel/edit_profile_model.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../Dashboard/botton_bar_1.dart';
import '../../Utils/constants.dart';
import '../../models/CommonModel/user_data_model.dart';
import '../../network/api_client.dart';
import '../../network/repository.dart';
import '../Dashboard/bottom_nav_bar.dart';
import '../Dashboard/home_screen.dart';
import 'main_screen.dart';
import 'package:http/http.dart' as http;




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Repository repositoryRepo = Repository(ApiClient(httpClient: http.Client()));


  @override
  void initState() {
    super.initState();
    checkIsAuthorized();
  }

  Future<void> checkIsAuthorized() async {
    String? val;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    val = await prefs.getString("accessSession");
    print("val: $val");

    try {
      print("abd ${val}");
      UserData splashScreenModelData = await repositoryRepo.getProfileSplashAPICall(access: val);
      // SplashScreenModel splashScreenModelData = await repositoryRepo.getProfileSplashAPICall(access: val);
      print("splashScreenModelData: ${splashScreenModelData}");

      appUserData = splashScreenModelData;

      var user_data = jsonDecode(json.encode(splashScreenModelData));

      userDataForSession = json.encode(UserData.fromJson(user_data));
      print("userDataForSession: $userDataForSession");
      await prefs.setString("userSessionData", userDataForSession!);

      String? normal = await prefs.getString("userSessionData");
      print("normal: $normal");


      print("val for dash: $val");
      accessToken = val;

      UserDatas = jsonDecode(normal!) as Map<String,dynamic>;
      print("UserDatas splash: $UserDatas");
      sessionParesdData = UserData.fromJson(UserDatas!);

      print("splash :${sessionParesdData!.firstName}");

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavBarScreen()),(route) => false,);



    } catch(error) {
      print("error: $error");
      // Navigator.pushNamed(context,LoginScreen.routeName);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MainPageScreen()),(route) => false);

    }


  }


  @override
  void dispose() {
    super.dispose();
  }



  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // User is already logged in, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
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
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
  backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
            width: main_Width * 0.8,
            child: Image.asset("assets/images/trackventory2.png")),
      ),
    );
  }
}
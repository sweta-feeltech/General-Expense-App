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
    checkLoginStatus();
  }

  Future<void> checkIsAuthorized() async {
    String? val;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    val = await prefs.getString("accessSession");
    print("val: $val");

    try {
      UserData2 splashScreenModelData = await repositoryRepo.getProfileSplashAPICall(access: val);
      // SplashScreenModel splashScreenModelData = await repositoryRepo.getProfileSplashAPICall(access: val);
      print("splashScreenModelData: ${splashScreenModelData}");

      appUserData = splashScreenModelData;

      var user_data = jsonDecode(json.encode(splashScreenModelData));

      userDataForSession = json.encode(UserData2.fromJson(user_data));
      print("userDataForSession: $userDataForSession");
      await prefs.setString("userSessionData", userDataForSession!);

      String? normal = await prefs.getString("userSessionData");
      print("normal: $normal");

      // bool? isAlredayUser = await prefs.getBool("IsAppUser");
      // print("isAlredayGuest: $isAlredayUser");

      print("val for dash: $val");
      accessToken = val;
      // isSubscriber = splashScreenModelData.isSubscriber;
      // IsGuest = false;
      // IsAppUser = isAlredayUser;

      UserDatas = jsonDecode(normal!) as Map<String,dynamic>;
      print("UserDatas splash: $UserDatas");
      sessionParesdData = UserData2.fromJson(UserDatas!);

      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBarScreen()));
      // Navigator.pushReplacementNamed(context,DashboardScreen.routeName);
    } catch(error) {
      print("error: $error");
      // Navigator.pushNamed(context,LoginScreen.routeName);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInScreen()));

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
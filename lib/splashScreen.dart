import 'package:flutter/material.dart';

import 'conts.dart';
import 'dashboardScreen.dart';
import 'mainpage.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Add any initialization logic here, such as loading data
    Future.delayed(Duration(seconds: 3), () {

      AuthorizedUser == true ?

          // debugPrint("author")
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      )
      :

          // debugPrint("notauth");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPageScreen(),
        ),
      );



    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: Container(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/g.png",
              fit: BoxFit.fill ,),),
        ),
      ),

    );
  }
}

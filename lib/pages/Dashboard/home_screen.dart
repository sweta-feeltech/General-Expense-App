import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/colors.dart';
import '../Widgets/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: primaryGrey,
      appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
          ),
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: Colors.black,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
          titleSpacing: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryGrey,
      ),

      drawer: Drawer(
        width: main_Width * 0.6,
        child: NavDrawer(),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: main_Height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello,",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: main_Height * 0.020,
                        ),
                      ),

                      Text("Dytta!",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: main_Height * 0.022,
                        ),
                      ),

                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: main_Height * 0.023,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: main_Height * 0.02),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
                ),
              child: SvgPicture.asset("assets/images/card.svg",
              clipBehavior: Clip.antiAlias,
              fit: BoxFit.fill,
              ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}

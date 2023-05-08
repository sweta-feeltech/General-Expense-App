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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_outlined,
            color: Colors.black,),
            onPressed: () {
              // Add your onPressed logic here
              ///for notification
            },
          ),
        ],
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

            Padding(padding: EdgeInsets.symmetric(horizontal: main_Height * 0.02,vertical: main_Height * 0.01),
              child: Stack(
                children: [

                  Container(
                        height: main_Height * 0.2,
                    child: SvgPicture.asset("assets/images/Card1.svg",
                      clipBehavior: Clip.antiAlias,
                      fit: BoxFit.fill,
                    ),
                  ),


                  Container(
                    height: main_Height * 0.2,
                    padding: EdgeInsets.symmetric(
                      vertical: main_Height * 0.023,
                      horizontal:  main_Height * 0.023
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Balance",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFFCED6EC),
                                    fontSize: main_Height * 0.018,
                                  ),
                                ),

                                Text("\$4,680.00 ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: main_Height * 0.033,
                                  ),
                                ),



                              ],
                            ),

                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                  height: main_Height * 0.027,
                                  width: main_Height * 0.027,
                                  child: SvgPicture.asset("assets/images/dot.svg")),
                            )

                          ],
                        ),

                        SizedBox(
                          height: main_Height * 0.04,
                        ),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    child: SvgPicture.asset("assets/images/up.svg",
                                      clipBehavior: Clip.antiAlias,
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                                  SizedBox(
                                    width: main_Width * 0.03,
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Income",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFFCED6EC),
                                          fontSize: main_Height * 0.014,
                                        ),
                                      ),

                                      Text("\$3,500.00",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: main_Height * 0.018
                                        ),
                                      ),

                                    ],),

                                ],
                              ),
                            ),


                              Expanded(
                                child: Row(
                                  children: [

                                    Container(
                                      child: SvgPicture.asset("assets/images/down.svg",
                                        clipBehavior: Clip.antiAlias,
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    SizedBox(
                                      width: main_Width * 0.03,
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Expense",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFFCED6EC),
                                            fontSize: main_Height * 0.014,
                                          ),
                                        ),

                                        Text("\$1,2300.00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: main_Height * 0.018
                                          ),
                                        ),

                                      ],),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            ),


            ///
            /// Heading
            ///


            Padding(
              padding: EdgeInsets.symmetric(vertical: main_Height * 0.008,horizontal: main_Height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Last Added",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: main_Height * 0.018,
                      fontWeight: FontWeight.w500
                  ),
                ),

                Text("See All",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: main_Height * 0.016,
                      fontWeight: FontWeight.w200
                  ),
                )
              ],),
            ),


            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child : SvgPicture.asset("assets/images/intenetI.svg",
                              fit: BoxFit.contain,
                            )
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Internet Bill",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: main_Height * 0.018,
                                  letterSpacing: 0.06,
                                ),
                              ),


                              Row(
                                children: [
                                  Text("31 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 09:30 AM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("-\$125",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFFF64E4E),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/images/groceryI.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Grocery Shopping",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 0.06,
                                    fontWeight: FontWeight.w500,
                                    fontSize: main_Height * 0.018
                                ),
                              ),


                              Row(
                                children: [
                                  Text("27 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 03:10 PM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("-\$125",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFFF64E4E),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/images/bankI.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Bank Transfer",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 0.06,
                                    fontWeight: FontWeight.w500,
                                    fontSize: main_Height * 0.018
                                ),
                              ),


                              Row(
                                children: [
                                  Text("25 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 09:00 AM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("+\$2800",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFF25B07F),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child : SvgPicture.asset("assets/images/healthI.svg",
                              fit: BoxFit.contain,
                            )
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Health",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: main_Height * 0.018,
                                  letterSpacing: 0.06,
                                ),
                              ),


                              Row(
                                children: [
                                  Text("23 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 01:25 PM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("-\$125",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFFF64E4E),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/images/salI.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Salary",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 0.06,
                                    fontWeight: FontWeight.w500,
                                    fontSize: main_Height * 0.018
                                ),
                              ),


                              Row(
                                children: [
                                  Text("18 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 11:10 AM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("+\$6000",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFF25B07F),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child : SvgPicture.asset("assets/images/shopI.svg",
                              fit: BoxFit.contain,
                            )
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shopping",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: main_Height * 0.018,
                                  letterSpacing: 0.06,
                                ),
                              ),


                              Row(
                                children: [
                                  Text("12 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 06:00 AM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("-\$125",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFFF64E4E),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006),
              child: Expanded(
                child: Container(
                  height: main_Height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: main_Height * 0.061,
                        width: main_Height * 0.061,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFF1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child : SvgPicture.asset("assets/images/subI.svg",
                              fit: BoxFit.contain,
                            )
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: main_Width * 0.04,horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subscription",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: main_Height * 0.018,
                                  letterSpacing: 0.06,
                                ),
                              ),


                              Row(
                                children: [
                                  Text("10 Oct, 2022  ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/dot1.svg"),
                                  Text(" 09:30 AM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF959698),
                                        fontSize: main_Height * 0.017
                                    ),
                                  ),

                                ],
                              )




                            ],
                          ),
                        ),
                      ),


                      Container(
                        child: Center(
                          child: Text("-\$150",
                            style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFFF64E4E),
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.02
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

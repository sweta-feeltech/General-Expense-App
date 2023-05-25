import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/Utils/constants.dart';
import 'package:general_expense_app/models/CommonModel/user_data_model.dart';
import 'package:general_expense_app/pages/Group/group_list_screen.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/colors.dart';
import '../Widgets/nav_drawer.dart';
import '../Widgets/common_widgets.dart';

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
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your onPressed logic here
              ///for notification
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: main_Height * 0.02),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text("Hello,",
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: main_Height * 0.020,
            //             ),
            //           ),
            //
            //           Text("Dytta!",
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: main_Height * 0.022,
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //       CircleAvatar(
            //         backgroundColor: Colors.white,
            //         radius: main_Height * 0.023,
            //         child: CircleAvatar(
            //           backgroundColor: Colors.grey,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    height: main_Height * 0.21,
                    width: main_Width,
                    child: SvgPicture.asset(
                      "assets/images/Card1.svg",
                      clipBehavior: Clip.antiAlias,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: main_Height * 0.2,
                    padding: EdgeInsets.symmetric(
                        vertical: main_Height * 0.018,
                        horizontal: main_Height * 0.023),
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
                                Text(
                                  "Total Balance",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFFCED6EC),
                                    fontSize: main_Height * 0.018,
                                  ),
                                ),
                                Text(
                                  "\$4,680.00 ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: main_Height * 0.028,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: main_Height * 0.027,
                                width: main_Height * 0.027,
                                child: SvgPicture.asset(
                                    "assets/images/dot.svg"))
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
                                      child: SvgPicture.asset(
                                        "assets/images/down.svg",
                                        clipBehavior: Clip.antiAlias,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: main_Width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Income",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFFCED6EC),
                                            fontSize: main_Height * 0.014,
                                          ),
                                        ),
                                        Text(
                                          "\$3,500.00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: main_Height * 0.018),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      child: SvgPicture.asset(
                                        "assets/images/up.svg",
                                        clipBehavior: Clip.antiAlias,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: main_Width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Expense",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFFCED6EC),
                                            fontSize: main_Height * 0.014,
                                          ),
                                        ),
                                        Text(
                                          "\$12,300.00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: main_Height * 0.018),
                                        ),
                                      ],
                                    ),
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Added",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: main_Height * 0.018,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See All  > ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1,
                        fontSize: main_Height * 0.016,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),

            ListView.builder(
                itemCount: 7,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return CommonWidgets.CommonListView(context);
                })
          ],
        ),
      ),
    );
  }
}

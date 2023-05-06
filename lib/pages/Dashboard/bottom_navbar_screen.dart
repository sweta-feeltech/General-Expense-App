import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Dashboard/add_inventory.dart';
import 'package:general_expense_app/pages/Dashboard/expense_screen.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';
import 'package:general_expense_app/pages/Dashboard/inventory_screen.dart';
import 'package:general_expense_app/pages/Dashboard/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavbarScreen extends StatefulWidget {
  @override
  _BottomNavbarScreenState createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ExpenseScreen(),
    InventoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddInventoryScreen()));
          //code to execute on button press
        },
        child: Icon(Icons.add),
        backgroundColor: primaryPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          color: Colors.white,
        ),
        child: ClipRRect(
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(30.0),
          //   topRight: Radius.circular(30.0),
          // ),
          child: BottomAppBar(
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
            notchMargin: 5,
            child: Container(
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [primaryPurple, Colors.black],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.topRight,
                  //   stops: [0.1, 0.8],
                  //   tileMode: TileMode.clamp,
                  // ),
                  color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: main_Height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: SvgPicture.asset(
                      _currentIndex == 0
                          ? "assets/icons/home_1.svg"
                          : "assets/icons/home.svg",
                      height: main_Height * 0.06,
                      width: main_Height * 0.06,
                      fit: BoxFit.none,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: _currentIndex == 1
                        ? SvgPicture.asset(
                            "assets/icons/expense_1.svg",
                            height: main_Height * 0.06,
                            width: main_Height * 0.06,
                            fit: BoxFit.none,
                          )
                        : SvgPicture.asset(
                            "assets/icons/expense.svg",
                            height: main_Height * 0.06,
                            width: main_Height * 0.06,
                            fit: BoxFit.none,
                          ),
                  ),
                  SizedBox(
                    height: main_Height * 0.065,
                    width: main_Height * 0.065,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: _currentIndex == 2
                        ? SvgPicture.asset(
                            "assets/icons/inventory_1.svg",
                            height: main_Height * 0.06,
                            width: main_Height * 0.06,
                            fit: BoxFit.none,
                          )
                        : SvgPicture.asset(
                            "assets/icons/inventory.svg",
                            height: main_Height * 0.06,
                            width: main_Height * 0.06,
                            fit: BoxFit.none,
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    child: _currentIndex == 3
                        ? SvgPicture.asset(
                            "assets/icons/profile_1.svg",
                            height: main_Height * 0.06,
                            width: main_Height * 0.06,
                            fit: BoxFit.none,
                          )
                        : SvgPicture.asset(
                            "assets/icons/profile.svg",
                            height: main_Height * 0.06,
                            width: main_Height * 0.06,
                            fit: BoxFit.none,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}

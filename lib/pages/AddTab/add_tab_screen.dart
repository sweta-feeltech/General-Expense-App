import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';

import '../Dashboard/add_expense_screen.dart';
import '../Dashboard/add_item_screen.dart';


class AddTabScreen extends StatefulWidget {

  Function backPressCallback;

   AddTabScreen(this.backPressCallback, {super.key});

  @override
  State<AddTabScreen> createState() => _AddTabScreenState();
}

class _AddTabScreenState extends State<AddTabScreen> {


  var index1;

  @override
  void initState() {
    index1 = 0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
          unselectedLabelColor: Colors.black,
          labelColor: Color(0xFFFB1414),
          labelStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFFFB1414),
              fontSize: main_Height * 0.016,
              fontWeight: FontWeight.w500),
          indicator: ContainerTabIndicator(
              // color: Color(0xFFFFF3F3),
            color: Colors.white,
              radius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
          background: Container(
            color: primaryPurple,
          )
        ),
        initialIndex: 0,
        tabs: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                'Add Expense',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: main_Height * 0.02,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(top: 2),
              child: Text(
                'Add Item',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: main_Height * 0.02,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
        views: [
          AddExpenseScreen(),
          AddItemScreen("","")
        ],
        onChange: (index) {
          setState(() {
            index1 = index;
          });
          return print("index here :$index   jbsv ${index1}");
        },
      ),

    );
  }
}

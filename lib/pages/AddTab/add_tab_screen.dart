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

      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "Add Expense/Item",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        centerTitle: false,
      ),

      body: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.black,
          labelStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontSize: main_Height * 0.02,
              fontWeight: FontWeight.w500
          ),
          indicator: ContainerTabIndicator(
            color: Colors.white,
              radius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
          background: Container(
            color: primaryPurple,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: main_Height * 0.02,
            fontWeight: FontWeight.w500
        ),
        ),
        initialIndex: 0,
        tabs: [

          Tab(
            text: "Add Expense",
          ),

          Tab(
            text: "Add Item",
          )

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

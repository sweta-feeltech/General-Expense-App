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
            indicatorColor: primaryPurple,
            padding: EdgeInsets.symmetric(horizontal: 20)),
        tabs: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
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
            child: Center(
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
          AddItemScreen()

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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';

import '../../Utils/colors.dart';
import 'list_screen.dart';

class ExpenseScreen extends StatefulWidget {
  static String routeName = 'ExpenseScreen';
  Function backPressCallback;
  ExpenseScreen(this.backPressCallback, {super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryGrey,
      appBar: AppBar(
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
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          onPressed: () {
            widget.backPressCallback.call();
            // Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        titleSpacing: 0,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryGrey,
        elevation: 0,
        centerTitle: true,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListOfExpenses()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      // width: main_Width * 0.4,
                      height: main_Height * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFE6EBFE)
                      ),

                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Income",
                            style: TextStyle(
                              color: Color(0xFFAAB1CF),
                              fontSize: main_Height * 0.015
                            ),
                            ),
                            SizedBox(height: main_Height * 0.01,),
                            Text("\$7,750.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF677CD2),
                                fontSize: main_Height * 0.022,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                  SizedBox(
                    width: main_Width * 0.028,
                  ),

                  Expanded(
                    child: Container(
                      // width: main_Width * 0.4,
                      height: main_Height * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFF6E5DC)
                      ),

                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Expense",
                            style: TextStyle(
                              color: Color(0xFFD0B6A8),
                                fontSize: main_Height * 0.015
                            ),),
                            SizedBox(
                              height: main_Height * 0.01,
                            ),
                            Text("\$4,390.00",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFE98852),
                                fontSize: main_Height * 0.022,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),

            Container(
              height: main_Height * 0.1,
              width: main_Width * 1,
              decoration: BoxDecoration(
                  color: Colors.transparent
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Container(
                        height: main_Height * 0.052,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            // border: Border.all(
                            //     color: primaryPurple,
                            //     width: 1
                            // ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Income",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Color(0xFF959698),
                              fontWeight: FontWeight.w600,
                              fontSize: main_Height * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: main_Width * 0.028,
                    ),

                    Expanded(
                      child: Container(
                        height: main_Height * 0.052,
                        decoration: BoxDecoration(
                            color: primaryPurple,
                            // border: Border.all(
                            //   color: Colors.white,
                            //   width: 1,
                            // ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("EXPENSE",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: main_Height * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';

import '../Dashboard/add_expense_screen.dart';


class ListOfExpenses extends StatefulWidget {
  static String routeName = '/listOfExpenses';
  const ListOfExpenses({Key? key}) : super(key: key);

  @override
  State<ListOfExpenses> createState() => _ListOfExpensesState();
}

class _ListOfExpensesState extends State<ListOfExpenses> {
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
        // leading: IconButton(
        //   padding: EdgeInsets.zero,
        //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
        //   onPressed: () {
        //     // widget.backPressCallback.call();
        //     Navigator.of(context).pop();
        //   },
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        // ),
        titleSpacing: 15,
        title: Text(
          "Expense List",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),

      bottomSheet: Container(
        height: main_Height * 0.1,
        width: main_Width * 1,
        decoration: BoxDecoration(
          color: Colors.white
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
                          // color: Colors.green,
                          border: Border.all(
                            color: primaryPurple,
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(30)
                        ),
                  child: Center(
                    child: Text("ADD INCOME",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: primaryPurple,
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
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                        AddExpenseScreen.routeName
                    );

                  },
                  child: Container(
                    height: main_Height * 0.052,
                    decoration: BoxDecoration(
                      color: primaryPurple,
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text("ADD EXPENSE",
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
              ),


            ],
          ),
        ),
      ),


      body: Padding(
        padding: EdgeInsets.only(bottom: main_Height * 0.1,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///
              /// Heading
              ///


              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Income",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: main_Height * 0.021,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {

                        ///
                      },
                      child: Container(
                        height: main_Height * 0.05,
                        width: main_Height * 0.05,
                        child: SvgPicture.asset(
                          "assets/images/add.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              ///
              ///List
              ///

              Container(
                height: main_Height * 0.735,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return   CommonWidgets.masterCategoryCardOfUI2(context,
                            () {},
                        index: 1
                      );

                    }),
              ),


            ],
          ),
        ),
      ),




    );
  }
}

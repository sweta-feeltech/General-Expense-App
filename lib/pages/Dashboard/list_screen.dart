import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/Utils/colors.dart';


class ListOfExpenses extends StatefulWidget {
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
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          onPressed: () {
            // widget.backPressCallback.call();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        titleSpacing: 0,
        title: Text(
          "Expense List",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryGrey,
        elevation: 0,
        centerTitle: true,
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


            ],
          ),
        ),
      ),


      body: Padding(
        padding: EdgeInsets.only(bottom: main_Height * 0.1,left: main_Width * 0.03,right: main_Width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///
              /// Heading
              ///


              Padding(
                padding: EdgeInsets.symmetric(vertical: main_Height * 0.008),
                child: Row(children: [
                  Text("Last Added",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: main_Height * 0.018,
                    fontWeight: FontWeight.w500
                  ),
                  )
                ],),
              ),

              ///
              ///List
              ///

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
      ),




    );
  }
}

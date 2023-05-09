import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/shelf_screen.dart';
import '../../Utils/colors.dart';
import 'common_widgets.dart';


class Shelf1Screen extends StatefulWidget {
  static String routeName = '/shelf1Screen';


  const Shelf1Screen({Key? key}) : super(key: key);

  @override
  State<Shelf1Screen> createState() => _Shelf1ScreenState();
}

class _Shelf1ScreenState extends State<Shelf1Screen> {


  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return WillPopScope(

      onWillPop: () async{

        Navigator.of(context).pop();
        return true;
      },

      child: Scaffold(

        backgroundColor: primaryGrey,

        appBar: AppBar(
          // leading: IconButton(
          //   padding: EdgeInsets.zero,
          //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          //   onPressed: () {
          //     widget.backPressCallback.call();
          //     // Navigator.of(context).pop();
          //   },
          //   icon: const Icon(Icons.arrow_back, color: Colors.black),
          // ),
          titleSpacing: 15,
          title: Text(
            "Shelf1",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          // centerTitle: true,
        ),

        body: Column(
          children: [


            Padding(
              padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Shelf 1",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: main_Height * 0.021,
                        fontWeight: FontWeight.w500
                    ),
                  ),

                  InkWell(
                    onTap: (){


                    },
                    child: Container(
                      height: main_Height * 0.05,
                      width: main_Height * 0.05,
                      child: SvgPicture.asset("assets/images/addI.svg",
                        fit: BoxFit.fill,),
                    ),
                  )


                ],
              ),
            ),

            Expanded(
              child: Accordion(
                  rightIcon: SvgPicture.asset(
                    "assets/images/down1.svg",
                    fit: BoxFit.fill,
                  ),
                headerBorderRadius: 5.0,
                contentBorderRadius: 5.0,
                headerBackgroundColor: Colors.black12,
                contentBackgroundColor: Colors.white,
                paddingListTop: 0,
                paddingListBottom: 0,
                maxOpenSections: 2,
                headerTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: main_Height * 0.019,
                    fontWeight: FontWeight.w500),
                leftIcon: Icon(Icons.home_filled,
                    color: Colors.black),
                children: [

                  for(int i = 0; i <= 15; i ++)

               AccordionSection(headerText:"Places",
              content:   Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(color: Colors.black,width: 2)
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Things ",
                            style :  TextStyle(
                                color: Colors.black,
                                fontSize: main_Height * 0.019,
                                fontWeight: FontWeight.w500)),
                        Icon(Icons.access_alarm)
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2,
                    ),


                    Row(
                      children: [
                        Text("Things ",
                            style :  TextStyle(
                                color: Colors.black,
                                fontSize: main_Height * 0.019,
                                fontWeight: FontWeight.w500)),
                        Icon(Icons.access_alarm)
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2,
                    ),


                    Row(
                      children: [
                        Text("Things ",
                            style :  TextStyle(
                                color: Colors.black,
                                fontSize: main_Height * 0.019,
                                fontWeight: FontWeight.w500)),
                        Icon(Icons.access_alarm)
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2,
                    ),


                    Row(
                      children: [
                        Text("Things ",
                            style :  TextStyle(
                                color: Colors.black,
                                fontSize: main_Height * 0.019,
                                fontWeight: FontWeight.w500)),
                        Icon(Icons.access_alarm)
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 2,
                    ),


                  ],
                ),
              ))




                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

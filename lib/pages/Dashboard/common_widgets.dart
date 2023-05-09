import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/shelf_1_screen.dart';
import 'package:general_expense_app/pages/Dashboard/shelf_screen.dart';

import '../../Utils/colors.dart';

class CommonWidgets {

  static Widget CommonListView(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(padding: EdgeInsets.symmetric(vertical: main_Height * 0.006,horizontal: main_Width * 0.03),
      child: Expanded(
        child: Container(
          height: main_Height * 0.09,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
                  borderRadius: BorderRadius.circular(10),
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
    ) ;
  }


  static Widget CommonInventoryList(BuildContext context,
      {int? index}
      ) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
          ShelfScreen.routeName
        );

        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InventoryScreen2()));
      },
      child: Material(
        borderRadius: BorderRadius.circular(7),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            // padding: EdgeInsets.all(10),
            height: main_Height * 0.1,
            width: main_Width * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: getColor(index!,4)

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: main_Height * 0.06,
                  width: main_Height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(15)),
                  // child: items.categoryImg != null ?
                  padding: EdgeInsets.all(5),
              child :
                    SvgPicture.asset("assets/images/icn.svg",
                    fit: BoxFit.contain,
                    ),
                ),
                SizedBox(
                  height: main_Height * 0.02,
                ),
                Column(
             children: [
               Text(
                 "Diffrent Places",
                 maxLines: 1,
                 // items.name.toString(),
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w600,
                     fontSize: main_Height * 0.014),
               ),

               Text(
                 "7 Devices",
                 maxLines: 1,
                 // items.name.toString(),
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                     color: darkGrey,
                     fontWeight: FontWeight.w600,
                     fontSize: main_Height * 0.014),
               ),
             ],
             )
              ],
            ),
          ),
        ),
      ),
    );

  }


  static Widget CommonShelfListView(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){

            Navigator.of(context).pushNamed(
                Shelf1Screen.routeName
            );

          },
          child: Container(
            height: main_Height * 0.05,
            decoration: BoxDecoration(
              color: primaryGrey,
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(13),
            ),
            padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
            child: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Places : Some Demo Text",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 0.06,
                      fontWeight: FontWeight.w500,
                      fontSize: main_Height * 0.018
                  ),
                ),
              ),
            ),

          ),
        ),
        Divider(height: 3,color: Colors.black,
          endIndent: 0,indent: 0,)
      ],
    );
  }


}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    ) ;
  }


  static Widget CommonInventoryList(BuildContext context,
      {int? index}
      ) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        // Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>CategoryCoursesScreen(
        //     "${courseCategoryModelData![index].id}"
        // )));
        // Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context) => new AllNuBeeRequestListScreen()));
      },

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3),
        height: main_Height * 0.1,
        width: main_Width * 0.25,
        decoration: BoxDecoration(
          // boxShadow: const [
          // boxShadow: const [
          //   BoxShadow(
          //       blurRadius: 0.5, color: Colors.grey),
          // ],
            borderRadius: BorderRadius.circular(15),
            color: getColor(index!,4)

        ),
        child: Center(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Container(
                height: main_Height * 0.06,
                width: main_Height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(10)),
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
    );

  }


}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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



  static Widget CommonInventoryList(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {

      },

      child: Card(
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAlias,
        shadowColor: const Color.fromARGB(255, 78, 78, 78),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Material(
          elevation: 8,
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(212, 245, 245, 245),
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Color.fromARGB(225, 241, 98, 120),
                      // blurStyle: BlurStyle.normal
                      blurStyle: BlurStyle.normal),
                ]),
            width: main_Width * 0.43,
            // Details Of Main Card
            child: Column(
              children: [
                // Main Image in card
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: Container(

                        decoration: BoxDecoration(
                            // color: getColor(index!, courseCategoryModelData!.length),
                            borderRadius: BorderRadius.circular(10),
                            // image: DecorationImage(
                            //   image: courseCategoryModelData![index].categoryImg == null
                            //       ? const AssetImage(
                            //       "assets/images/image_not_found.png")
                            //   as ImageProvider
                            //       : NetworkImage(
                            //       "$BASEIMAGEURL${courseCategoryModelData![index].categoryImg}"),
                            //   fit: BoxFit.fill,
                            // )

                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.only(bottom: 8, right: 8, left: 8, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Diffrent Places",
                          maxLines: 2,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              // fontSize: 16
                              fontSize: main_Height * 0.016),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }


}

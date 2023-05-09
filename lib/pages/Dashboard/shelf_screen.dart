import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/colors.dart';
import 'common_widgets.dart';


class ShelfListScreen extends StatefulWidget {
  static String routeName = '/shelfListScreen';
  const ShelfListScreen({Key? key}) : super(key: key);

  @override
  State<ShelfListScreen> createState() => _ShelfListScreenState();
}

class _ShelfListScreenState extends State<ShelfListScreen> {


  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(

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
          "Shelf",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
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
              headerBackgroundColor: Colors.white,
              contentBackgroundColor: primaryOrange,
              paddingListTop: 0,
              paddingListBottom: 0,
              maxOpenSections: 3,
              headerTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: main_Height * 0.019,
                  fontWeight: FontWeight.w500),
              leftIcon: Icon(Icons.home_filled,
                  color: Colors.black),
              children: [

                for(int i = 0; i <= 15; i ++)

             AccordionSection(headerText:"Place",
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text("Things",
                      style :  TextStyle(
                          color: Colors.black,
                          fontSize: main_Height * 0.019,
                          fontWeight: FontWeight.w500)),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),

                Text("Things",
                    style :  TextStyle(
                        color: Colors.black,
                        fontSize: main_Height * 0.019,
                        fontWeight: FontWeight.w500)),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),

                Text("Things",
                    style :  TextStyle(
                        color: Colors.black,
                        fontSize: main_Height * 0.019,
                        fontWeight: FontWeight.w500)),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),

                Text("Things",
                    style :  TextStyle(
                        color: Colors.black,
                        fontSize: main_Height * 0.019,
                        fontWeight: FontWeight.w500)),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),





              ],
            ))




              ],
            ),
          ),
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import 'common_widgets.dart';


class ShelfScreen extends StatefulWidget {
  static String routeName = '/ShelfScreen';
  const ShelfScreen({Key? key}) : super(key: key);

  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {



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
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          // centerTitle: true,
        ),

        body:   Column(
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Shelf",
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
              child: ListView.builder(
                  itemCount: 25,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return CommonWidgets.CommonShelfListView(context);
                  }),
            ),
          ],
        ),





      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/common_widgets.dart';

import '../../Utils/colors.dart';

class InventoryScreen extends StatefulWidget {
  static String routeName = 'InventoryScreen';
  Function backPressCallback;
  InventoryScreen(this.backPressCallback,{super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
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
          "Inventory",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: main_Width * 0.03,right: main_Width * 0.03, top: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Inventories ",
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
              SizedBox(height: 10,),
              Container(
                height: main_Height * 0.75,
                padding: EdgeInsets.symmetric(vertical: 2),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 6/4.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                      10,
                          (index) {
                        return CommonWidgets.CommonInventoryList(context,index: index,);
                      }
                  ),
                ),
              )
            ],
          ),
        ),
      ),



    );
  }
}

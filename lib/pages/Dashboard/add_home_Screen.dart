import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';

import '../../Utils/colors.dart';
import '../Widgets/theme_helper.dart';

class AddHomeScreen extends StatefulWidget {
  static String routeName = 'AddHomeScreen';
  AddHomeScreen({super.key});

  @override
  State<AddHomeScreen> createState() => _AddHomeScreenState();
}

class _AddHomeScreenState extends State<AddHomeScreen> {


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
          "Home",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Home",
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
                    ThemeHelper.addHomeDialogBox(
                        context: context,
                        logoutPress: () {},
                        heightData: main_Height,
                        popupTitle: "Add a Home",
                        popupcontent: "popupcontent"
                    );

                  },
                  child: Container(
                    height: main_Height * 0.05,
                    width: main_Height * 0.05,
                    child: SvgPicture.asset("assets/images/add.svg",
                      fit: BoxFit.fill,),
                  ),
                )


              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                childAspectRatio: 6/4.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                    3,
                        (index) {
                      return CommonWidgets.CommonHomeList(context,index: index,);
                    }
                ),
              ),
            ),

          ),
          SizedBox(height: 10,),
        ],
      ),

    );
  }
}

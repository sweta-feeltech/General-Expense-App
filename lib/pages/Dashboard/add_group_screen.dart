import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/pages/Widgets/theme_helper.dart';

import '../../Utils/colors.dart';
import 'common_widgets.dart';

class AddGroupScreen extends StatefulWidget {

  static String routeName = '/addGroupScreen';

  const AddGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
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
          "Group",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),


          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset("assets/icons/group.svg",
                  height: main_Height * 0.4,

                ),
              ),



              Text(
                "You don't have any Groups !",
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  // color: Color.fromARGB(255, 158, 158, 158),
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: main_Height * 0.0239,
                ),
              ),

              SizedBox(
                height: main_Height * 0.04,
              ),

              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: main_Height * 0.060,
                  width: main_Width * 0.5,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      side: BorderSide(
                          style: BorderStyle.none
                      ),
                      backgroundColor: primaryPurple,
                    ),
                    onPressed: () {
                      ThemeHelper.addGroupDialogBox(
                          context: context,
                          logoutPress: () {},
                          heightData: main_Height,
                          popupTitle: "Add a Group",
                          popupcontent: "popupcontent");


                    },
                    child: Text(
                      "Add Group",
                      style: TextStyle(
                          fontSize: main_Height < 700 ? 12 : 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              )

            ],
          ),

      ///



    );
  }
}

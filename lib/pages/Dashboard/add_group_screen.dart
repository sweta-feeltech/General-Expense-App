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

      backgroundColor: Colors.white,

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
          "Group List",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),


          //
          // body: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Center(
          //       child: Image.asset(
          //         "assets/images/grp.jpg",
          //         height: main_Height * 0.4,
          //       ),
          //     ),
          //
          //
          //
          //     Text(
          //       "You don't have any Groups !",
          //       maxLines: 1,
          //       textAlign: TextAlign.center,
          //       overflow: TextOverflow.ellipsis,
          //       style: TextStyle(
          //         // color: Color.fromARGB(255, 158, 158, 158),
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: main_Height * 0.0239,
          //       ),
          //     ),
          //
          //     SizedBox(
          //       height: main_Height * 0.04,
          //     ),
          //
          //     InkWell(
          //       onTap: (){
          //
          //         ThemeHelper.addGroupDialogBox(
          //             context: context,
          //             logoutPress: () {},
          //             heightData: main_Height,
          //             popupTitle: "Add a Group",
          //             popupcontent: "popupcontent"
          //         );
          //
          //       },
          //       child: Container(
          //         height: main_Height * 0.045,
          //         width: main_Width * 0.5,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(3),
          //           border: Border.all(
          //             color: primaryPurple,
          //             width: 3
          //           ),
          //         ),
          //
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SvgPicture.asset("assets/icons/addGrp.svg",
          //             height: main_Height * 0.027,
          //               width: main_Height * 0.027,
          //             ),
          //             SizedBox(width: 8,),
          //             Text("Start a new group",
          //               maxLines: 2,
          //               textAlign: TextAlign.center,
          //               overflow: TextOverflow.ellipsis,
          //               style: TextStyle(
          //                 // color: Color.fromARGB(255, 158, 158, 158),
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: main_Height * 0.017,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     )
          //
          //   ],
          // ),

      ///


      body: Column(
        children: [

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Group",
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

                    ThemeHelper.addGroupDialogBox(
                        context: context,
                        logoutPress: () {},
                        heightData: main_Height,
                        popupTitle: "Add a Group",
                        popupcontent: "popupcontent");

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


          // Expanded(
          //   child: ListView.builder(
          //       itemCount: 4,
          //       itemBuilder: (BuildContext context, int index) {
          //         return   CommonWidgets.CommonGroupListView(context,index: index);
          //
          //       }),
          // ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                childAspectRatio: 5/4.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                    10,
                        (index) {
                      return CommonWidgets.CommonGroupList2(context,index: index,);
                    }
                ),
              ),
            ),
          ),


        ],
      ),





    );
  }
}

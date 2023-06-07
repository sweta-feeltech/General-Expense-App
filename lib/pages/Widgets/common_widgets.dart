import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/models/DashboardModel/dashboard_model.dart';
import 'package:general_expense_app/models/Expense/get_expense_list_model.dart';
import 'package:general_expense_app/models/GroupModel/group_members_model.dart';
import 'package:general_expense_app/pages/Locations/room_screen.dart';
import 'package:general_expense_app/pages/Locations/shelf_screen.dart';
import 'package:general_expense_app/pages/Income_Expense/pdf_viewer_screen.dart';
import 'package:general_expense_app/pages/Widgets/theme_helper.dart';
import 'package:intl/intl.dart';
import '../../Utils/api_end_points.dart';
import '../../Utils/colors.dart';
import '../../models/GroupModel/add_group_model.dart';
import '../../models/GroupModel/group_list_model.dart';
import '../../models/IncomeListModel/income_list_model.dart';
import '../../models/Locations/home_list_model.dart';
import '../../models/Locations/room_list_model.dart';
import '../../models/Locations/shelf_list_model.dart';
import '../Dashboard/items_screen.dart';
import '../Group/single_group_screen.dart';

class CommonWidgets {
  static Widget CommonListView(BuildContext context,
      ) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.03),
      child: Container(
        height: main_Height * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
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
                child: SvgPicture.asset(
                  "assets/images/bankI.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: main_Width * 0.03, horizontal: main_Width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bank Transfer",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0.06,
                        fontWeight: FontWeight.w500,
                        fontSize: main_Height * 0.018),
                  ),
                  Row(
                    children: [
                      Text(
                        "25 Oct, 2022  ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF959698),
                            fontSize: main_Height * 0.015),
                      ),
                      SvgPicture.asset("assets/images/dot1.svg"),
                      Text(
                        " 09:00 AM",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF959698),
                            fontSize: main_Height * 0.017),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "+\u20B92800",
                  style: TextStyle(
                      letterSpacing: 0.6,
                      color: Color(0xFF25B07F),
                      fontWeight: FontWeight.w500,
                      fontSize: main_Height * 0.02),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget CommonDashboardListView(BuildContext context,
      {required IncomeAndExpense dashboardModelData,
      }
      ) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;




    return Padding(
      padding: EdgeInsets.symmetric(horizontal: main_Width * 0.02,vertical: main_Height * 0.005),
      child: Container(
            height: main_Height * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
          padding: EdgeInsets.only(
              top: main_Height * 0.007,
              bottom: main_Height * 0.007,
              right: main_Width * 0.02,
              left: main_Width * 0.04
          ),
        width: main_Width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(dashboardModelData!.description == null ? dashboardModelData!.remarks : dashboardModelData!.description ).toString()}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0.06,
                        fontWeight: FontWeight.w500,
                        fontSize: main_Height * 0.018),
                  ),
                  Text(
                    "${(dashboardModelData!.incomeDate == null ? dashboardModelData!.expenseDate : dashboardModelData!.incomeDate).toString().substring(0,19).replaceAll("T"," ")}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF959698),
                        fontSize: main_Height * 0.015),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${(dashboardModelData!.incomeDate == null ? "-":"+")}${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.amount)).replaceAll(".00","")}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 0.6,
                      color: dashboardModelData?.remarks == null ?  Color(0xFF25B07F) : Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: main_Height * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget CommonGroupList2(BuildContext context,
      {int? index,
      required GetGroupListModel getGroupListModel,
      required VoidCallback? onPressed}) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    return InkWell(
      ///
      /// For Delete Group
      ///
      /// onTap: onPressed,
      onTap: () {
        // onPressed;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SingleGroupViewScreen("${getGroupListModel!.id}")));
      },
      child: Material(
        borderRadius: BorderRadius.circular(7),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: primaryGrey
                // color: getColor(index!,4)

                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: getColor(index!, index),
                        borderRadius: BorderRadius.circular(5)),
                    // child: items.categoryImg != null ?
                    child: Center(
                      child: Text(
                        "${getGroupListModel!.groupName!.substring(0, 1).toUpperCase()}",
                        style: TextStyle(fontSize: main_Height * 0.1),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: main_Height * 0.05,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${getGroupListModel?.groupName}",
                        maxLines: 1,
                        // items.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: main_Height * 0.014),
                      ),
                      Text(
                        "${getGroupListModel!.description}",
                        // "7 Members",
                        maxLines: 1,
                        // items.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: darkGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: main_Height * 0.014),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget CommonGroupList3(BuildContext context,
      {int? index,
        required GetGroupListModel getGroupListModel,
        required VoidCallback? onPressed}) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    return InkWell(
      ///
      /// For Delete Group
      ///
      /// onTap: onPressed,
      onTap: () {
        // onPressed;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SingleGroupViewScreen("${getGroupListModel!.id}")));
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.01,vertical: main_Height * 0.005),
        child: Material(
          borderRadius: BorderRadius.circular(7),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: main_Width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: primaryGrey
                // color: getColor(index!,4)

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: getColor(index!, index),
                          borderRadius: BorderRadius.circular(5)),
                      // child: items.categoryImg != null ?
                      child: Center(
                        child: Text(
                          "${getGroupListModel!.groupName!.substring(0, 1).toUpperCase()}",
                          style: TextStyle(fontSize: main_Height * 0.1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: main_Height * 0.05,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${getGroupListModel?.groupName}",
                          maxLines: 1,
                          // items.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: main_Height * 0.014),
                        ),
                        Text(
                          "${getGroupListModel!.description}",
                          // "7 Members",
                          maxLines: 1,
                          // items.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: darkGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: main_Height * 0.014),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget CommonMemberListView(
    BuildContext context, {
    required GroupMembersModel groupMembersModelData,
  }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.03),
      child: InkWell(
        onTap: () {

        },
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(7),
          child: Container(
            height: main_Height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: main_Width * 0.12,
                  width: main_Width * 0.12,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFF1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${groupMembersModelData!.memberName!.toUpperCase().substring(0, 1)}",
                      style: TextStyle(
                          color: Colors.black, fontSize: main_Width * 0.07),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: main_Width * 0.03,
                      horizontal: main_Width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${groupMembersModelData!.memberName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.06,
                            fontWeight: FontWeight.w500,
                            fontSize: main_Height * 0.018),
                      ),
                      Text(
                        "${groupMembersModelData!.isGroupAdmin == true ? "Admin" : "Member"}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF959698),
                            fontSize: main_Height * 0.015),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget CommonIncomeListView(
    BuildContext context, {
    required IncomeListModel getIncomeListModelData,
  }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.03),
      child: Container(
        height: main_Height * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: main_Height * 0.061,
                    width: main_Height * 0.061,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFEFF1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/bankI.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: main_Width * 0.03,
                        horizontal: main_Width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${getIncomeListModelData!.description}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              letterSpacing: 0.06,
                              fontWeight: FontWeight.w500,
                              fontSize: main_Height * 0.018),
                        ),


                        Text(
                          "${getIncomeListModelData!.incomeDate.toString().replaceAll("T", ", ").substring(0, 20)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF959698),
                              fontSize: main_Height * 0.015),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  "+\u20B9${getIncomeListModelData!.amount.toStringAsFixed(0)}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      letterSpacing: 0.6,
                      color: Color(0xFF25B07F),
                      fontWeight: FontWeight.w500,
                      fontSize: main_Height * 0.018),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget CommonRoomList(BuildContext context,
      {int? index,
        required GetRoomListModel getRoomListModelData,
      }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => ShelfScreen("${getRoomListModelData!.id}")));

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
                color: getColor(index!, 4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: main_Height * 0.06,
                  width: main_Height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  // child: items.categoryImg != null ?
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.meeting_room,
                    size: main_Height * 0.04,
                  ),
                ),
                SizedBox(
                  height: main_Height * 0.02,
                ),
                Column(
                  children: [
                    Text(
                      "${getRoomListModelData!.roomLocationName}",
                      maxLines: 1,
                      // items.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: main_Height * 0.014),
                    ),
                    Text(
                      "${getRoomListModelData!.description}",
                      maxLines: 1,
                      // items.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: darkGrey,
                          fontWeight: FontWeight.w500,
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

  static Widget CommonHomeList(BuildContext context,
      {int? index,
        required GetHomeListModel getHomeListModelData,
      }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => RoomScreen("${getHomeListModelData!.id}")));
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
                color: getColor(index!, 4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: main_Height * 0.06,
                    width: main_Height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    // child: items.categoryImg != null ?
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                      size: main_Height * 0.04,
                    )
                    // SvgPicture.asset("assets/images/shome.svg",),
                    ),
                SizedBox(
                  height: main_Height * 0.02,
                ),
                Column(
                  children: [
                    Text(
                      "${getHomeListModelData!.homeLocationName}",
                      maxLines: 1,
                      // items.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: main_Height * 0.014),
                    ),
                    Text(
                      "${getHomeListModelData!.description}",
                      maxLines: 1,
                      // items.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: darkGrey,
                          fontWeight: FontWeight.w500,
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

  static Widget CommonListShelf(BuildContext context,
      {int? index,
        required GetShelfListModel getShelfListModelData,
      }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.03),
      child: InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => ItemScreen()));
        },
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(7),
          child: Container(
            height: main_Height * 0.09,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: main_Height * 0.061,
                  width: main_Height * 0.061,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFF1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/intenetI.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: main_Width * 0.03,
                      horizontal: main_Width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${getShelfListModelData!.shelfLocationName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.06,
                            fontWeight: FontWeight.w500,
                            fontSize: main_Height * 0.018),
                      ),
                      Text(
                        "${getShelfListModelData!.description}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF959698),
                            fontSize: main_Height * 0.015),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget CommonListShelf2(BuildContext context, {int? index}) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.03),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(
          //     Shelf1Screen.routeName
          // );
        },
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(7),
          child: Container(
            height: main_Height * 0.09,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: main_Height * 0.061,
                  width: main_Height * 0.061,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFF1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/inventory.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: main_Width * 0.03,
                      horizontal: main_Width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shelfs Item ${index! + 1}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.06,
                            fontWeight: FontWeight.w500,
                            fontSize: main_Height * 0.018),
                      ),
                      Text(
                        "Shelf Item's ${index! + 1}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF959698),
                            fontSize: main_Height * 0.015),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  static Widget masterCategoryCardOfUI(
      BuildContext context, VoidCallback onOpenBottomSheet,
      {int? index}) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.03),
      child: Container(
        height: main_Height * 0.12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
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
                child: SvgPicture.asset(
                  "assets/images/intenetI.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: main_Width * 0.03, horizontal: main_Width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      width: main_Width * 0.5,
                      child: Text(
                        "CATEGORY Name ${index! + 1}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.06,
                            fontWeight: FontWeight.w500,
                            fontSize: main_Height * 0.018),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          width: main_Width * 0.5,
                          child: Row(
                            children: [
                              Text(
                                "Name Id : ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                    fontSize: main_Height * 0.015),
                              ),
                              Text(
                                "Home ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontSize: main_Height * 0.015),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          width: main_Width * 0.5,
                          child: Row(
                            children: [
                              Text(
                                "Location : ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                    fontSize: main_Height * 0.015),
                              ),
                              Text(
                                " Location",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontSize: main_Height * 0.015),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    ThemeHelper.bottomSheetforAddItems(context);
                  },
                  child: Container(
                    height: main_Height * 0.05,
                    width: main_Height * 0.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/edit.svg",
                        height: main_Height * 0.03,
                        width: main_Height * 0.03,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: main_Height * 0.05,
                    width: main_Height * 0.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/delete.svg",
                        height: main_Height * 0.03,
                        width: main_Height * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget masterCategoryCardOfUI2(
    BuildContext context,
    VoidCallback onOpenBottomSheet, {
    int? index,
    required GetExpenseListModel getExpenseListModelData,
  }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.025),
      child: Container(
        height: main_Height * 0.17,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: main_Width * 0.025, vertical: main_Height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "${getExpenseListModelData.expenseDate.toString().replaceAll("T", " ~ ")}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF959698),
                        fontSize: main_Height * 0.017),
                  ),
                ),
                InkWell(
                  onTap: () {


                    showDialog(
                      context: context,
                      builder: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(15.0),
                            child: Stack(
                              children: <Widget>[

                                getExpenseListModelData?.receipt?.substring(
                                    getExpenseListModelData!.receipt
                                        .toString()
                                        .length! -
                                        4) ==
                                    ".pdf"
                                    ?


                                Container(
                                  height: main_Height * 0.3,
                                  width: main_Width * 0.6,

                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)
                                        )// Set the desired color
                                      ),
                                    onPressed: (){

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PdfViewerScreen(path: "${getExpenseListModelData!.receipt}")));

                                                },
                                      child: Center(child:

                                      Image.asset("assets/images/pdf_pre.png",
                                        height: main_Height * 0.15,
                                        width: main_Height * 0.15,
                                      )

                                      )),
                                )
                                    :
                                Container(
                                  height: main_Height * 0.3,
                                  width: main_Width * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  // color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                      "assets/images/inf.jpg",
                                      image:
                                      "$BASEIMAGEURL${getExpenseListModelData.receipt}",
                                      imageErrorBuilder:
                                      ((context, error, stackTrace) {
                                        return Image.asset(
                                            "assets/images/inf.jpg");
                                      }),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  top: 0.0,
                                  right: 0.0,
                                  child: FloatingActionButton(
                                    child: Image.asset("assets/images/q.png"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80)),
                                    backgroundColor: Colors.white,
                                    mini: true,
                                    elevation: 5.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/images/eye.svg",
                    height: main_Height * 0.035,
                    width: main_Height * 0.035,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Category : ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: main_Height * 0.018),
                    ),
                    Flexible(
                      child: Text(
                        "${getExpenseListModelData.expenseCategoryName}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.black,
                            fontSize: main_Height * 0.018),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Amount : ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: main_Height * 0.018),
                    ),
                    Flexible(
                      child: Text(
                        "\u{20B9} ${getExpenseListModelData.amount}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontSize: main_Height * 0.018),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "To Pay : ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: main_Height * 0.018),
                    ),
                    Flexible(
                      child: Text(
                        "${getExpenseListModelData.toPay}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontSize: main_Height * 0.018),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Remarks : ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: main_Height * 0.018),
                    ),
                    Flexible(
                      child: Text(
                        "${getExpenseListModelData.remarks.toString().replaceAll("\n", " ")}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontSize: main_Height * 0.018),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}

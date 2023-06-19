import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/models/CustomModel/horizontal_search_list_model.dart';
import 'package:general_expense_app/models/CustomModel/vertical_search_list_model.dart';
import 'package:general_expense_app/models/DashboardModel/dashboard_model.dart';
import 'package:general_expense_app/models/DashboardModel/search_allData_model.dart';
import 'package:general_expense_app/models/Expense/get_expense_list_model.dart';
import 'package:general_expense_app/models/GroupModel/group_members_model.dart';
import 'package:general_expense_app/models/Locations/Item_list_model.dart';
import 'package:general_expense_app/pages/Locations/item_list_screen.dart';
import 'package:general_expense_app/pages/Locations/room_screen.dart';
import 'package:general_expense_app/pages/Locations/shelf_screen.dart';
import 'package:general_expense_app/pages/Income_Expense/pdf_viewer_screen.dart';
import 'package:general_expense_app/pages/Widgets/theme_helper.dart';
import 'package:intl/intl.dart';
import '../../Utils/api_end_points.dart';
import '../../Utils/colors.dart';
import '../../models/DashboardModel/transaction_filter_model.dart';
import '../../models/GroupModel/add_group_model.dart';
import '../../models/GroupModel/group_list_model.dart';
import '../../models/Expense/income_list_model.dart';
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
                    "${DateFormat("dd MMM  hh:mm a").format(DateTime.parse("${dashboardModelData!.incomeDate == null ? dashboardModelData!.expenseDate : dashboardModelData!.incomeDate}"))}",
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
                      fontSize: dashboardModelData.amount.toString().length > 6 ?  dashboardModelData.amount.toString().length > 8 ? main_Height * 0.014 : main_Height * 0.016 : main_Height * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   static Widget CommonFilterIncomeExpnseListView(BuildContext context,
      {required IncomeAndExpense1 dashboardModelData,
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
                    "${(dashboardModelData!.description == null ? dashboardModelData.description : dashboardModelData.description ).toString()}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0.06,
                        fontWeight: FontWeight.w500,
                        fontSize: main_Height * 0.018),
                  ),
                  Text(
                    "${DateFormat("dd MMM  hh:mm a").format(DateTime.parse("${dashboardModelData.date}"))}",
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
                  "${(dashboardModelData.transactionType == "Expense" ? "-":"+")}${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.amount)).replaceAll(".00","")}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 0.6,
                      color: dashboardModelData.transactionType == "Expense" ?  Colors.red  : Color(0xFF25B07F),
                      fontWeight: FontWeight.w500,
                      fontSize: dashboardModelData.amount.toString().length > 6 ?  dashboardModelData.amount.toString().length > 8 ? main_Height * 0.014 : main_Height * 0.016 : main_Height * 0.02),
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
        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>SingleGroupViewScreen("${getGroupListModel!.id}")));

        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) =>
        //         SingleGroupViewScreen("${getGroupListModel!.id}")));
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
    required GetIncomeListModel getIncomeListModelData,
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
                        "${DateFormat("dd MMM  hh:mm a").format(DateTime.parse("${getIncomeListModelData!.incomeDate}"))}",
                        // "${getIncomeListModelData!.incomeDate.toString().replaceAll("T", ", ").substring(0, 20)}",
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
                "+\u20B9${getIncomeListModelData!.amount?.toStringAsFixed(0)}",
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
              .push(MaterialPageRoute(builder: (context) => ItemListScreen("${getShelfListModelData!.id}","0")));
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
                    "${DateFormat("dd MMM  hh:mm a").format(DateTime.parse("${getExpenseListModelData.expenseDate}"))}",
                    // "${getExpenseListModelData.expenseDate.toString().replaceAll("T", " ~ ")}",
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


                                // Positioned(
                                //   top: 0.0,
                                //   right: 0.0,
                                //   child: FloatingActionButton(
                                //     child: Image.asset("assets/images/q.png"),
                                //     onPressed: () {
                                //       Navigator.pop(context);
                                //     },
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(80)),
                                //     backgroundColor: Colors.white,
                                //     mini: true,
                                //     elevation: 5.0,
                                //   ),
                                // ),
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



  static Widget masterCardforItem(
      BuildContext context,
       {
        int? index,
        required GetItemListModel getItemListModelData,
      }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: main_Height * 0.005, horizontal: main_Width * 0.025),
      child: Container(
        height: main_Height * 0.12,
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
                    "\u{20B9} ${getItemListModelData!.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontSize: main_Height * 0.018),
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

                                getItemListModelData?.receipt?.substring(
                                    getItemListModelData!.receipt
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

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PdfViewerScreen(path: "${getItemListModelData!.receipt}")));

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
                                      "$BASEIMAGEURL${getItemListModelData.receipt}",
                                      imageErrorBuilder:
                                      ((context, error, stackTrace) {
                                        return Image.asset(
                                            "assets/images/inf.jpg");
                                      }),
                                    ),
                                  ),
                                ),

                                // Positioned(
                                //   top: 0.0,
                                //   right: 0.0,
                                //   child: FloatingActionButton(
                                //     child: Image.asset("assets/images/q.png"),
                                //     onPressed: () {
                                //
                                //       Navigator.pop(context);
                                //
                                //       },
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //         BorderRadius.circular(80)),
                                //     backgroundColor: Colors.white,
                                //     mini: true,
                                //     elevation: 5.0,
                                //   ),
                                // ),



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
                      "Item Name : ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontSize: main_Height * 0.018),
                    ),
                    Flexible(
                      child: Text(
                        "${getItemListModelData!.itemName}",
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
                        "${getItemListModelData.description.toString().replaceAll("\n", " ")}",
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





  static Widget titleAndFilterDateRageAndCustomFilterUIWidget(
      BuildContext context,
      {
        required String dataRangeText,
        required VoidCallback dataPickerOnTap,
        required VoidCallback customFilterPressedFunc,
      }
      ) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,vertical: main_Height * 0.01),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Flexible(
              child: Text(
                "Transactions",
                        maxLines: 1,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: main_Height * 0.018,
                            fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: dataPickerOnTap,

                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5),
                    child: Row(
                      children: [
                        Container(
                          padding:const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: primaryPurple,
                                width: 1
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: -2,
                                  color: Color.fromARGB(255, 190, 190, 190),
                                  blurStyle: BlurStyle.solid
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                dataRangeText,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500
                                ),
                              ),

                              const SizedBox(width: 2,),

                              const IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(minWidth: 15, minHeight: 40),

                                onPressed: null,
                                disabledColor: Colors.black,
                                icon: Image(image: AssetImage("assets/images/calender.png")),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5,),

                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            spreadRadius: -2,
                            color: Color.fromARGB(255, 190, 190, 190),
                            blurStyle: BlurStyle.solid
                        ),
                      ],
                    ),
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            border: Border.all(color:primaryPurple),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white
                        ),
                        child: IconButton(
                          color: primaryPurple,
                          icon: const Icon(Icons.tune),
                          constraints: const BoxConstraints(minHeight: double.infinity),
                          onPressed: customFilterPressedFunc,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }





  static Widget CommonSearchVerticalListView(BuildContext context,
      {required VerticalSearchListModel verticalSearchListModelData,
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

            verticalSearchListModelData!.itemtype == "shelf"
                ?
          Row(
            children: [
              Container(
                height: main_Height * 0.061,
                width: main_Height * 0.061,
                decoration: BoxDecoration(
                  color: Color(0xFFEFEFF1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.door_sliding_outlined,
                  color: Color(0xFFC3C6D0),
                  size: main_Height * 0.04,
                ),
              ),
              SizedBox(
                width: main_Width * 0.02,
              )
            ],
          )  : verticalSearchListModelData!.itemtype == "item"  ?
            Row(
              children: [
                Container(
                  height: main_Height * 0.061,
                  width: main_Height * 0.061,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFF1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.streetview_rounded,
                    color: Color(0xFFC3C6D0),
                    size: main_Height * 0.04,
                  ),
                ),
                SizedBox(
                  width: main_Width * 0.02,
                )
              ],
            )
                :Container(),

            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(verticalSearchListModelData!.title == null ? verticalSearchListModelData!.title : verticalSearchListModelData!.title ).toString()}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0.06,
                        fontWeight: FontWeight.w500,
                        fontSize: main_Height * 0.018),
                  ),
                  Text(
                    "${DateFormat("dd MMM  hh:mm a").format(DateTime.parse("${verticalSearchListModelData!.date == null ? verticalSearchListModelData!.date : verticalSearchListModelData!.date}"))}",
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

            verticalSearchListModelData!.transctionType == "expense" ||
                verticalSearchListModelData!.transctionType == "income"
                ?
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${verticalSearchListModelData!.transctionType == "expense" ? "-" : verticalSearchListModelData!.transctionType == "income" ? "+" : ""}${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((double.parse("${verticalSearchListModelData!.amount}"))).replaceAll(".00","")}",
                  // "${(verticalSearchListModelData!.transctionType == "expense" ? "-" : verticalSearchListModelData!.transctionType == "income" ? "+" : "")}${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((double.parse("${verticalSearchListModelData!.amount}"))).replaceAll(".00","")}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 0.6,
                      color: verticalSearchListModelData?.transctionType == "expense" ? Colors.red : verticalSearchListModelData!.transctionType == "income" ? Color(0xFF25B07F) : Colors.white,
                      // color: verticalSearchListModelData?.title == null ?  Color(0xFF25B07F) : Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: verticalSearchListModelData.amount.toString().length > 6 ?  verticalSearchListModelData.amount.toString().length > 8 ? main_Height * 0.014 : main_Height * 0.016 : main_Height * 0.02),
                ),
              ),
            ) :
                Container()

            ,
          ],
        ),
      ),
    );
  }




  static Widget CommonHorizontalSearchList(BuildContext context,
      {int? index,
        required HorizontalSearchListModel horizontalSearchListModelData,
        }) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    return InkWell(
      ///
      /// For Delete Group
      ///
      /// onTap: onPressed,
      onTap: () {
        // onPressed;
        horizontalSearchListModelData!.boxtype == "Home" ?
        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>RoomScreen("${horizontalSearchListModelData!.id}")))
            :
        horizontalSearchListModelData!.boxtype == "Room" ?
        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>ShelfScreen("${horizontalSearchListModelData!.id}")))
            :
        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>SingleGroupViewScreen("${horizontalSearchListModelData!.id}")));

        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) =>
        //         SingleGroupViewScreen("${getGroupListModel!.id}")));
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
                        child:

                            horizontalSearchListModelData!.boxtype == "Home" ?

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
                        ) :

                            horizontalSearchListModelData!.boxtype == "Room" ?

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
                            )

                                :

                        Text(
                          "${horizontalSearchListModelData!.title!.substring(0, 1).toUpperCase()}",
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
                          "${horizontalSearchListModelData?.title}",
                          maxLines: 1,
                          // items.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: main_Height * 0.014),
                        ),
                        Text(
                          "${horizontalSearchListModelData?.desc}",
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




}

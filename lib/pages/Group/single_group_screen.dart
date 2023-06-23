import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/blocs/SingleGroupViewScreen/single_group_member_screen_bloc.dart';
import 'package:general_expense_app/models/GroupModel/group_link_model.dart';
import 'package:general_expense_app/models/GroupModel/group_members_model.dart';
import 'package:general_expense_app/models/GroupModel/single_group_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../../Utils/colors.dart';
import '../../network/repository.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';

class SingleGroupViewScreen extends StatefulWidget {
  final String id;

  SingleGroupViewScreen(this.id, {super.key});

  @override
  State<SingleGroupViewScreen> createState() => _SingleGroupViewScreenState();
}

class _SingleGroupViewScreenState extends State<SingleGroupViewScreen> {


  List<GroupMembersModel>? groupMemberModelData;

  // GroupLinkModel? groupLinkModeldata;

  SingleGroupViewScreenBloc singleGroupViewScreenBloc =
  SingleGroupViewScreenBloc(Repository.getInstance());

  @override
  void initState() {
    super.initState();
    loadAllGroupdataScreenApiCalls();
  }

  void loadAllGroupdataScreenApiCalls() {
    singleGroupViewScreenBloc
        .add(FetchAllSingleGroupViewScreenAPIsEvent("${widget.id}"));
    // singleGroupViewScreenBloc
    //     .add(FetchAllSingleGroupLinkScreenAPIsEvent("${widget.id}"));

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider<SingleGroupViewScreenBloc>(
        create: (context) =>
        singleGroupViewScreenBloc..add(SingleGroupViewScreenInitialEvent()),
        child:
        BlocConsumer<SingleGroupViewScreenBloc, SingleGroupViewScreenState>(
          builder: (context, state) {

            if (state is SingleGroupViewScreenLoadingEventState) {

              return ThemeHelper.buildLoadingWidget();
            }
            if (state is FetchAllSingleGroupViewScreenAPIsEventState) {
              print("abcdsdd");

              groupMemberModelData = state.groupMembersModelData;


              return mainViewSingleGroup();

            }
            //  if (state is FetchAllSingleGroupLinkScreenAPIsEventState) {
            //
            //   groupLinkModeldata = state.groupLinkModeldata;
            //
            //   return mainViewSingleGroup();
            //
            // }

            else {



               return Container();

            }
          },
          listener: (context, state) {
            if (state is ApiFailureState) {
              print(state.exception.toString());
              ThemeHelper.customDialogForMessage(
                  context,
                  (state.exception.toString().replaceAll('Exception:', ''))
                      .replaceAll(':', ''),
                  MediaQuery.of(context).size.width, () {
                Navigator.of(context, rootNavigator: true).pop();
              }, ForSuccess: false);
            }
          },
        ),
      ),
    );
  }

  Widget mainViewSingleGroup() {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 15,
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Share.share("${groupMemberModelData?[0].groupPin}");
                String code = "Your Friend/Family Member has Invited you to join a Group “${groupMemberModelData?[0].groupName}” on Track Inventory.\n"
                    "Please Enter the given code while joining the group : ${groupMemberModelData?[0].groupPin}.\n"
                    "https://feeltechsolutions.com/" ;

                Share.share(code);
              },
            ),
          ],
          title: Text(
            "Group Members",
            style:
            TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
          ),
        ),


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryPurple,
                  border: Border.all(width: 0, color: primaryPurple)),
              height: main_Height * 0.010,
            ),
            Container(
              color: primaryPurple,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: primaryPurple),
                        height: main_Height * 0.045,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.white),
                            color: Colors.white),
                        height: main_Height * 0.045,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: main_Width * 0.03,
                          ),
                          child: InkWell(
                            onTap: () {
                              // Share.share("${groupMemberModelData?[0].groupPin}");

                              String code = "Your Friend/Family Member has Invited you to join a Group “${groupMemberModelData?[0].groupName}” on Track Inventory.\n"
                              "Please Enter the given code while joining the group : ${groupMemberModelData?[0].groupPin}.\n"
                              "https://feeltechsolutions.com/" ;

                              Share.share(code);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: main_Width * 0.065,
                                  width: main_Width * 0.065,
                                  decoration: BoxDecoration(
                                    color: primaryGrey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.link,
                                      color: primaryPurple,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: main_Width * 0.012,
                                ),
                                Text(
                                  "Invite Member via link",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: main_Width * 0.04),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: main_Width * 0.1,
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryOrange,
                        ),
                        child: Container(
                          width: main_Height * 0.08,
                          height: main_Height * 0.08,
                          decoration: BoxDecoration(
                              color: primaryOrange,
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            width: main_Height * 0.08,
                            height: main_Height * 0.08,
                            alignment: Alignment.center,
                            child: Text(
                              "${groupMemberModelData?[0].groupName?.toUpperCase().substring(0, 1)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: main_Width * 0.07),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: main_Width * 0.1,
                  vertical: main_Height * 0.016),
              child: Text(
                "${groupMemberModelData?[0].groupName}",
                // child: Text("${singleGroupViewModelData?[0].groupName}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: main_Width * 0.06,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Divider(
              thickness: 2,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: groupMemberModelData?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommonWidgets.CommonMemberListView(context,
                        groupMembersModelData: groupMemberModelData![index]);
                  }),
            )


          ],
        ),
      ),
    );
  }
}

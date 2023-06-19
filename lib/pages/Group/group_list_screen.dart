import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/Utils/constants.dart';
import 'package:general_expense_app/models/GroupModel/group_list_model.dart';
import 'package:pinput/pinput.dart';

import '../../Utils/colors.dart';
import '../../blocs/GroupListScreen/group_list_screen_bloc.dart';
import '../../models/GroupModel/add_group_model.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';
import '../Widgets/common_widgets.dart';

class GroupListScreen extends StatefulWidget {
  static String routeName = '/GroupListScreen';

  const GroupListScreen({Key? key}) : super(key: key);

  @override
  State<GroupListScreen> createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  GroupListScreenBloc groupListScreenBloc =
      GroupListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<GetGroupListModel>? getGroupListModelData;

  AddGroupModel? addGroupModelData;
  AddGroupModel? addGroupModelData1;

  String? GroupName;
  String? Description;

  @override
  void initState() {
    super.initState();
    loadAllGroupListScreenApiCalls();
  }

  void loadAllGroupListScreenApiCalls() {
    //TODO: remove static values
    groupListScreenBloc.add(FetchAllGroupListScreenAPIsEvent());
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<GroupListScreenBloc>(
        create: (context) =>
            groupListScreenBloc..add(GroupListScreenInitialEvent()),
        child: BlocConsumer<GroupListScreenBloc, GroupListScreenState>(
          builder: (context, state) {
            if (state is GroupListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllGroupListScreenAPIsEventState) {
              getGroupListModelData = state.getGroupListModelData;

              return mainViewAllScreenViewWidget();
            } else if (state is PostCreateGroupEventState) {
              addGroupModelData = state.addGroupModelData;

              loadAllGroupListScreenApiCalls();

              return mainViewAllScreenViewWidget();
            } else if (state is PostJoinGroupEventState) {
              addGroupModelData = state.addGroupModelData;

              loadAllGroupListScreenApiCalls();

              return mainViewAllScreenViewWidget();
            } else if (state is DeleteGroupState) {
              addGroupModelData1 = state.addGroupModelData1;
              loadAllGroupListScreenApiCalls();
              return mainViewAllScreenViewWidget();
            } else {
              return Container();
            }
          },
          listener: (context, state) {
            if (state is APIFailureState) {

              ThemeHelper.customDialogForMessage(
                  context,
                  (state.exception.toString().replaceAll('Exception:', ''))
                      .replaceAll(':', ''),
                  MediaQuery.of(context).size.width, () {

                Navigator.of(context).pop();
                loadAllGroupListScreenApiCalls();
              }, ForSuccess: false);



            }
          },
        ));
  }

  Widget mainViewAllScreenViewWidget() {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    print("ddd${getGroupListModelData?.isEmpty}");

    return Scaffold(
      backgroundColor: primaryGrey,
      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "My Groups",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        centerTitle: false,
      ),
      body:
      getGroupListModelData?.isEmpty == true ?
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/stupid 2.svg",
              height: main_Height * 0.4,
              // fit: BoxFit.fill,
            ),

            //
            //
            // Text(
            //   "You don't have any Groups !",
            //   maxLines: 1,
            //   textAlign: TextAlign.center,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(
            //     // color: Color.fromARGB(255, 158, 158, 158),
            //     color: Colors.grey,
            //     fontWeight: FontWeight.w500,
            //     fontSize: main_Height * 0.0239,
            //   ),
            // ),
            //
            // SizedBox(
            //   height: main_Height * 0.04,
            // ),

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


                    _displayTextInputDialog(context);


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


                    _displayTextInputDialog2forpin(context);


                  },
                  child: Text(
                    "Join Group",
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
      ) :

      RefreshIndicator(
        onRefresh: () async {
          loadAllGroupListScreenApiCalls();
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Groups",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: main_Height * 0.021,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      final RenderBox appBarRenderBox =
                          context.findRenderObject() as RenderBox;
                      final Offset appBarOffset =
                          appBarRenderBox.localToGlobal(Offset.zero);
                      final Size appBarSize = appBarRenderBox.size;

                      _showPopupMenu(context, appBarOffset, appBarSize);

                      // _displayTextInputDialog(context);
                      ///
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       double main_Width = MediaQuery.of(context).size.width;
                      //       double main_Height = MediaQuery.of(context).size.height;
                      //
                      //       final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
                      //
                      //
                      //       return Dialog(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Form(
                      //           key: _formkey,
                      //           child: Stack(
                      //             alignment: Alignment.topCenter,
                      //             clipBehavior: Clip.none,
                      //             children: [
                      //               Material(
                      //                 elevation: 10,
                      //                 borderRadius: BorderRadius.circular(10),
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                     borderRadius: BorderRadius.circular(15),
                      //                     // color: Color.fromARGB(255, 217, 231, 250),
                      //                     color: Colors.white,
                      //                   ),
                      //                   height: main_Height * 0.35,
                      //                   width: main_Width * 0.7,
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      //                     child: Column(
                      //                       mainAxisAlignment: MainAxisAlignment.center,
                      //                       crossAxisAlignment: CrossAxisAlignment.start,
                      //                       children: [
                      //                         SizedBox(height: 15,),
                      //
                      //
                      //                         Text(
                      //                           "Add Group",
                      //                           style: TextStyle(
                      //                               fontSize: 20,
                      //                               color: Colors.black,
                      //                               fontWeight: FontWeight.w500
                      //                           ),
                      //                         ),
                      //
                      //                         TextFormField(
                      //                             onSaved: (onSavedVal) {
                      //                               GroupName = onSavedVal;
                      //                             },
                      //                             validator: (value) {
                      //                               if (value == null || value.isEmpty) {
                      //                                 return 'Group Name can\'t be empty';
                      //                               }
                      //                               return null;
                      //                             },
                      //                             decoration: InputDecoration(
                      //                               isDense: true,
                      //                               floatingLabelBehavior:
                      //                               FloatingLabelBehavior.never,
                      //                               hintText: "Enter a Group name",
                      //                               hintStyle: TextStyle(
                      //                                   fontWeight: FontWeight.w400,
                      //                                   color: darkGrey,
                      //                                   fontSize: main_Height * 0.018),
                      //                               contentPadding:
                      //                               EdgeInsets.only(top: 18, bottom: 0),
                      //                               enabledBorder:
                      //                               ThemeHelper.signupMyInputBorder(),
                      //                               constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                      //                               focusedBorder:
                      //                               ThemeHelper.signupMyFocusedBorder(),
                      //                             ),
                      //                             textInputAction: TextInputAction.next
                      //                         ),
                      //                         SizedBox(height: main_Height * 0.0435,),
                      //
                      //                         Text(
                      //                           "Add Description",
                      //                           style: TextStyle(
                      //                               fontSize: 20,
                      //                               color: Colors.black,
                      //                               fontWeight: FontWeight.w500
                      //                           ),
                      //                         ),
                      //
                      //                         TextFormField(
                      //                             onSaved: (onSavedVal) {
                      //                               Description = onSavedVal;
                      //                             },
                      //                             validator: (value) {
                      //                               if (value == null || value.isEmpty) {
                      //                                 return 'Description Name can\'t be empty';
                      //                               }
                      //                               return null;
                      //                             },
                      //                             decoration: InputDecoration(
                      //                               isDense: true,
                      //                               floatingLabelBehavior:
                      //                               FloatingLabelBehavior.never,
                      //                               hintText: "Enter a Group name",
                      //                               hintStyle: TextStyle(
                      //                                   fontWeight: FontWeight.w400,
                      //                                   color: darkGrey,
                      //                                   fontSize: main_Height * 0.018),
                      //                               contentPadding:
                      //                               EdgeInsets.only(top: 18, bottom: 0),
                      //                               enabledBorder:
                      //                               ThemeHelper.signupMyInputBorder(),
                      //                               constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                      //                               focusedBorder:
                      //                               ThemeHelper.signupMyFocusedBorder(),
                      //                             ),
                      //                             textInputAction: TextInputAction.next
                      //                         ),
                      //
                      //                         SizedBox(height: main_Height * 0.0235,),
                      //
                      //                         Row(
                      //                           mainAxisAlignment: MainAxisAlignment.center,
                      //                           children: [
                      //                             TextButton(
                      //                                 onPressed: () {
                      //                                   Navigator.pop(context);
                      //                                 },
                      //                                 style: ButtonStyle(
                      //                                     shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                      //                                 ),
                      //                                 child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                      //                             ),
                      //                             SizedBox(width: 5,),
                      //
                      //                             SizedBox(
                      //                               width: 75,
                      //                               child: TextButton(
                      //                                   style: ButtonStyle(
                      //                                       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                      //                                       backgroundColor: MaterialStateProperty.all(primaryPurple)
                      //                                   ),
                      //                                   onPressed: (){
                      //                                     if (_formkey.currentState!.validate()) {
                      //                                       _formkey.currentState!.save();
                      //                                       groupListScreenBloc
                      //                                           .add(PostCreateGroupEvent(GroupName!, Description!));
                      //                                     }
                      //
                      //                                   },
                      //                                   child: Text("Add",
                      //                                     overflow: TextOverflow.ellipsis,
                      //                                     style: TextStyle(
                      //                                         fontSize: main_Height * 0.01872,
                      //                                         color: Colors.white,
                      //                                         fontWeight: FontWeight.w500
                      //                                     ),
                      //                                   )
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     }
                      // );
                    },
                    child: Container(
                      height: main_Height * 0.05,
                      width: main_Height * 0.05,
                      child: SvgPicture.asset(
                        "assets/images/add.svg",
                        fit: BoxFit.fill,
                      ),
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
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 5 / 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                      int.parse("${getGroupListModelData?.length}"), (index) {
                    return CommonWidgets.CommonGroupList2(context,
                        index: index,
                        getGroupListModel: getGroupListModelData![index],
                        onPressed: () {
                      print("print");
                      groupListScreenBloc.add(DeleteGroupEvent(
                          "${getGroupListModelData![index].id}"));
                    });
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: _formkey,
            child: AlertDialog(
              title: Text(
                'Add a Group',
                style: TextStyle(),
              ),
              content: Container(
                height: main_Height * 0.12,
                width: main_Width * 0.08,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                          onSaved: (onSavedVal) {
                            GroupName = onSavedVal;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Group Name can\'t be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: "Enter a Group name",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: darkGrey,
                                fontSize: main_Height * 0.018),
                          ),
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: main_Height * 0.01,
                      ),
                      TextFormField(
                          onSaved: (onSavedVal) {
                            Description = onSavedVal;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Description Name can\'t be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: "Enter a Description name",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: darkGrey,
                                fontSize: main_Height * 0.018),
                          ),
                          textInputAction: TextInputAction.next),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryPurple)))),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: primaryPurple,
                          fontSize: main_Height * 0.01872,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryPurple))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryPurple)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          groupListScreenBloc.add(
                              PostCreateGroupEvent(GroupName!, Description!));
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Add",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: main_Height * 0.01872,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          );
        });
  }

  Future<void> _displayTextInputDialog2forpin(BuildContext context) async {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    bool? isOtpfieldEmpty;
    String? smsCode;

    final defaultPinTheme = PinTheme(
      width: main_Width * 0.15,
      height: main_Height * 0.07,
      textStyle: TextStyle(
          fontSize: main_Height * 0.0237,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: _formkey,
            child: AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              title: Text(
                'Pin put here to Join group',
                style: TextStyle(),
              ),
              content: Container(
                height: main_Height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Pinput(
                      onChanged: (pin) {
                        setState(() {
                          smsCode = pin;
                          isOtpfieldEmpty = false;
                        });
                      },
                      forceErrorState: isOtpfieldEmpty == true ? true : false,
                      onCompleted: (pin) {
                        print("complete: $pin");
                        setState(() {
                          smsCode = pin;
                          isOtpfieldEmpty = false;
                        });
                      },
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      showCursor: true,
                      length: 6,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
              ),
              actions: <Widget>[
                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryPurple)))),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: primaryPurple,
                          fontSize: main_Height * 0.01872,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryPurple))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryPurple)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          print("datafor join ${smsCode} ${appUserData!.id}");
                          groupListScreenBloc.add(PostJoinGroupEvent(
                              smsCode!, "${appUserData!.id}"));
                        }

                        print("ssss${smsCode}");

                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Join",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: main_Height * 0.01872,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          );
        });
  }

  void _showPopupMenu(
      BuildContext context, Offset appBarOffset, Size appBarSize) {
    final popupPosition = RelativeRect.fromLTRB(
      appBarOffset.dx + appBarSize.width - 10,
      appBarOffset.dy - appBarSize.height - 10,
      appBarOffset.dx + appBarSize.width + 10,
      appBarOffset.dy - 10,
    );

    showMenu(
      context: context,
      position: popupPosition,
      items: [
        PopupMenuItem(
          child: Text('Create Group'),
          value: '1',
          onTap: () {},
        ),
        PopupMenuItem(
          child: Text('Join Group'),
          value: '2',
          onTap: () {},
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == '1') {
        // Handle selected option
        print('Selected: $value');
        _displayTextInputDialog(context);
      } else if (value == '2') {
        print('Selected: $value');
        _displayTextInputDialog2forpin(context);
      }

      // if (value == null) {
      //   // Handle selected option
      //   print('Selected: $value');
      //   _displayTextInputDialog(context);
      // }else if(value != null){
      //   print('Selected: $value');
      //   _displayTextInputDialog2forpin(context);
      // }
    });
  }
}

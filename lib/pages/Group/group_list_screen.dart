import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/models/GroupModel/group_list_model.dart';

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


  GroupListScreenBloc groupListScreenBloc = GroupListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  List<GetGroupListModel>? getGroupListModelData;

  AddGroupModel? addGroupModeLData;


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
        create: (context) => groupListScreenBloc..add(GroupListScreenInitialEvent()),

        child: BlocConsumer<GroupListScreenBloc, GroupListScreenState>(

          builder: (context, state) {
            if(state is GroupListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            }
            else if(state is FetchAllGroupListScreenAPIsEventState) {
              getGroupListModelData = state.getGroupListModelData;


              return mainViewAllScreenViewWidget();
            }
            else if (state is PostCreateGroupEventState) {

              addGroupModeLData = state.addGroupModelData;


              return mainViewAllScreenViewWidget();

            }

            else {
              return Container();
            }
          },

          listener: (context, state) {
            if(state is ApiFailureState) {
              print(state.exception.toString());
              ThemeHelper.customDialogForMessage(context, (state.exception.toString().replaceAll('Exception:', '')).replaceAll(':',''), MediaQuery.of(context).size.width,
                      () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  ForSuccess: false
              );

            }
          },
        )
    );
  }


  Widget mainViewAllScreenViewWidget(){
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


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
        // centerTitle: true,
      ),




      body: RefreshIndicator(
        onRefresh: () async{
          loadAllGroupListScreenApiCalls();
        },
        child: Column(
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Groups",
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



                      _displayTextInputDialog(context);




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
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 5/5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                      int.parse("${getGroupListModelData?.length}"),
                          (index) {
                        return CommonWidgets.CommonGroupList2(context,index: index,
                        getGroupListModel: getGroupListModelData![index]
                        );
                      }
                  ),
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
              title: Text('Add a Group',
              style: TextStyle(

              ),
              ),
              content: Container(
                height: main_Height * 0.12,
                width: main_Width * 0.08,
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
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: "Enter a Group name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkGrey,
                              fontSize: main_Height * 0.018),
                        ),
                        textInputAction: TextInputAction.next
                    ),

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
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          hintText: "Enter a Description name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkGrey,
                              fontSize: main_Height * 0.018),
                        ),
                        textInputAction: TextInputAction.next
                    ),


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
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                      ),
                      child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                  ),
                ),

                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                          backgroundColor: MaterialStateProperty.all(primaryPurple)
                      ),
                      onPressed: (){
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          groupListScreenBloc
                              .add(PostCreateGroupEvent(GroupName!, Description!));
                        }

                        Navigator.of(context).pop();

                      },
                      child: Text("Add",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: main_Height * 0.01872,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                ),
              ],
            ),
          );
        });
  }


}

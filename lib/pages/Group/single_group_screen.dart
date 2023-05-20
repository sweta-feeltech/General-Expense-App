import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/blocs/SingleGroupViewScreen/single_course_view_screen_bloc.dart';
import 'package:general_expense_app/models/GroupModel/single_group_view_model.dart';

import '../../Utils/colors.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';

class SingleGroupViewScreen extends StatefulWidget {

  final String id;

   SingleGroupViewScreen(this.id,{super.key});

  @override
  State<SingleGroupViewScreen> createState() => _SingleGroupViewScreenState();
}

class _SingleGroupViewScreenState extends State<SingleGroupViewScreen> {



  List<SingleGroupViewModel>? singleGroupViewModelData;

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
            child: BlocConsumer<SingleGroupViewScreenBloc, SingleGroupViewScreenState>(
              builder: (context, state) {
                if (state is SingleGroupViewScreenLoadingEventState) {
                  return ThemeHelper.buildLoadingWidget();
                }
                if (state is FetchAllSingleGroupViewScreenAPIsEventState) {
                  singleGroupViewModelData = state.singleGroupViewModelData;
                  return mainViewAllCourseCatCourse();
                } else {
                  return mainViewAllCourseCatCourse();
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

    Widget mainViewAllCourseCatCourse (){

      double main_Width = MediaQuery.of(context).size.width;
      double main_Height = MediaQuery.of(context).size.height;

      return RefreshIndicator(
        onRefresh: () async {
        },
        child: Scaffold(

          backgroundColor: Colors.white,
          // resizeToAvoidBottomInset: false,
          appBar:AppBar(
            // centerTitle: false,
            titleSpacing: 0,
            backgroundColor: primaryPurple,
            elevation: 0,
            leading:   IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
              onPressed: () {
                // Navigator.of(context).pop();
                // widget.backPressCallback.call();
                Navigator.of(context).pop("refresh");
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            title:    Text("Group Members",
              style:
              TextStyle(color: Colors.white, fontSize: main_Height * 0.022),),

          ),


          // bottomSheet: Container(
          //   height: main_Height * 0.085,
          //   width: main_Width * 1,
          //   decoration: const BoxDecoration(color: Colors.white),
          //   child: Padding(
          //     padding:
          //     EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: 10),
          //     child: Container(
          //       height: main_Height * 0.06,
          //       width: main_Width * 0.75,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30),
          //           ),
          //           primary: primaryPurple,
          //         ),
          //         onPressed: () {},
          //         child: Text("Update",
          //           style: TextStyle(
          //               letterSpacing: 1,
          //               fontSize: main_Height * 0.018,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),


          body: SafeArea(
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Container(
                    decoration: BoxDecoration(
                        color: primaryPurple,
                        border: Border.all(
                            width: 0,
                            color: primaryPurple
                        )
                    ),
                    height: main_Height * 0.010,
                  ),
                  Container(
                    color: primaryPurple,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: primaryPurple
                              ),
                              height: main_Height * 0.045,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0,color: Colors.white),
                                  color: Colors.white
                              ),
                              height: main_Height * 0.045,
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
                              padding:  EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Container(
                                width: main_Height * 0.08,
                                height: main_Height * 0.08,
                                decoration: BoxDecoration(
                                  color: primaryPurple,
                                    borderRadius:
                                    BorderRadius.circular(15)),
                                child: Container(
                                  width: main_Height * 0.08,
                                  height:
                                  main_Height * 0.08,
                                child: Center(
                                  child: Text(
                                          "T",
                                    // "${singleGroupViewModelData![0].groupName!.substring(0,1).toUpperCase()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: main_Width * 0.1
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            )
                          ],)

                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.symmetric(
                    horizontal: main_Width * 0.1,
                    vertical: main_Height * 0.016
                  ),
                  child: Text("ABC",
                  // child: Text("${singleGroupViewModelData?[0].groupName}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: main_Width * 0.06,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  ),
                  Divider(thickness: 2, height: 0,indent: 0, endIndent: 0,),


                  SizedBox(
                    height: main_Height * 0.085,
                    width: main_Width * 1,
                  )
                ],
              ),
            ),
          ),

        ),
      );


    }

}

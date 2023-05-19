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

      return Scaffold(

        appBar: AppBar(
          titleSpacing: 15,
          title: Text(
            "Group Name : ${singleGroupViewModelData?[0].groupName}",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          // centerTitle: true,
        ),


    );


    }

}

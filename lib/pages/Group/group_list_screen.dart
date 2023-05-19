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


  DateTime todayDate = DateTime.now();


  @override
  void initState() {
    super.initState();
    loadAllGroupListScreenApiCalls();
  }

  void loadAllGroupListScreenApiCalls() {
    //TODO: remove static values
    // dashBoardScreenBloc.add(FetchDashBoardScreenAPICallEvent("sd=2023-04-01&ed=2023-09-05"));
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
        onRefresh: ()async{
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
}

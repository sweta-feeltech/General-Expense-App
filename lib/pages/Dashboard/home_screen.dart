import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/Utils/constants.dart';
import 'package:general_expense_app/blocs/HomeScreen/home_screen_bloc.dart';
import 'package:general_expense_app/models/CommonModel/user_data_model.dart';
import 'package:general_expense_app/models/DashboardModel/dashboard_model.dart';
import 'package:general_expense_app/pages/Dashboard/search_feild_screen.dart';
import 'package:general_expense_app/pages/Group/group_list_screen.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../Utils/colors.dart';
import '../../models/GroupModel/group_list_model.dart';
import '../../network/repository.dart';
import '../Widgets/nav_drawer.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  HomeScreenBloc homeScreenBloc =
  HomeScreenBloc(Repository.getInstance());


  List<GetGroupListModel>? getGroupListModelData;
  DashboardModel? dashboardModelData;



  @override
  void initState() {
    super.initState();
    loadAllHomeScreenApiCalls();
  }

  void loadAllHomeScreenApiCalls() {
    //TODO: remove static values
    homeScreenBloc.add(FetchAllHomeScreenAPIsEvent());
  }


  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<HomeScreenBloc>(
        create: (context) =>
        homeScreenBloc..add(HomeScreenInitialEvent()),
        child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllHomeScreenAPIsEventState) {


              getGroupListModelData = state.getGroupListModelData;
              dashboardModelData = state.dashboardModelData;

              return mainViewHomeAllScreenViewWidget();
            }
            else {
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
                mainViewHomeAllScreenViewWidget();
              }, ForSuccess: false);



            }
          },
        )
    );


  }



  Widget mainViewHomeAllScreenViewWidget(){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;





    dashboardModelData!.incomeAndExpense?.sort((a, b) => a.createdDate!.compareTo(b.createdDate!),);

    final dashbordFilterList = dashboardModelData!.incomeAndExpense!.reversed.toList();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: primaryGrey,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your onPressed logic here
              ///for notification
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryGrey,
      ),
      drawer: Drawer(
        width: main_Width * 0.6,
        child: NavDrawer(),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          loadAllHomeScreenApiCalls();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                child: Stack(
                  children: [
                    Container(
                      height: main_Height * 0.21,
                      width: main_Width,
                      child: SvgPicture.asset(
                        "assets/images/Card1.svg",
                        clipBehavior: Clip.antiAlias,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: main_Height * 0.22,
                      padding: EdgeInsets.symmetric(
                          vertical: main_Height * 0.018,
                          horizontal: main_Height * 0.023),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Balance",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFFCED6EC),
                                      fontSize: main_Height * 0.018,
                                    ),
                                  ),
                                  Text(
                                    "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.totalBalance))}",
                                    // "\u20B9 ${dashboardModelData?.totalBalance.toStringAsFixed(0)}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontSize: main_Height * 0.028,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  height: main_Height * 0.027,
                                  width: main_Height * 0.027,
                                  child: SvgPicture.asset(
                                      "assets/images/dot.svg"))
                            ],
                          ),
                          SizedBox(
                            height: main_Height * 0.04,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/images/down.svg",
                                          clipBehavior: Clip.antiAlias,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: main_Width * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Income",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Color(0xFFCED6EC),
                                              fontSize: main_Height * 0.014,
                                            ),
                                          ),
                                          Text(
                                            "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.totalIncome))}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: main_Height * 0.018),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/images/up.svg",
                                          clipBehavior: Clip.antiAlias,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: main_Width * 0.03,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Expense",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Color(0xFFCED6EC),
                                              fontSize: main_Height * 0.014,
                                            ),
                                          ),
                                          Text(
                                            "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.totalExpense))}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: main_Height * 0.018),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///
              /// Groups
              ///


              Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,vertical: main_Height * 0.005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Groups",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: main_Height * 0.018,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>GroupListScreen()));
                      },
                      child: Text(
                        "View All  > ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontSize: main_Height * 0.016,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: main_Height * 0.2,
                width: main_Width,
                child: ListView.builder(
                    // itemCount: getGroupListModelData!.length,
                    itemCount: getGroupListModelData!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {

                      return CommonWidgets.CommonGroupList3(context,
                          index: index,
                          getGroupListModel: getGroupListModelData![index],
                          onPressed: () {
                          });


                    }),
              ),



              ///
              /// Search Feild
              ///
              ///
              ///

              Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,vertical: main_Height * 0.005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search for Itoms",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: main_Height * 0.018,
                          fontWeight: FontWeight.w500),
                    ),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>GroupListScreen()));
                    //   },
                    //   child: Text(
                    //     "View All  > ",
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         letterSpacing: 1,
                    //         fontSize: main_Height * 0.016,
                    //         fontWeight: FontWeight.w200),
                    //   ),
                    // )
                  ],
                ),
              ),
              Hero(
                tag: "search",
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.005),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.none,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchFeildScreen()));
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: main_Height * 0.015), // Adjust vertical padding
                      hintText: 'Search Shelf',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchFeildScreen()));
                      // Do something with the search query
                    },

                  ),

                ),
              ),


              ///
              /// Last Added
              ///

              Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,vertical: main_Height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last Added",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: main_Height * 0.018,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "View All  > ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontSize: main_Height * 0.016,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),

              ListView.builder(
                  itemCount: dashbordFilterList!.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return CommonWidgets.CommonDashboardListView(context,
                    dashboardModelData: dashbordFilterList![index],
                    );
                  })



            ],
          ),
        ),
      ),
    );



  }

}

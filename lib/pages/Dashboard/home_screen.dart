import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/blocs/HomeScreen/home_screen_bloc.dart';
import 'package:general_expense_app/models/DashboardModel/dashboard_model.dart';
import 'package:general_expense_app/pages/Dashboard/view_all_income_expense.dart';
import 'package:general_expense_app/pages/Group/group_list_screen.dart';
import 'package:general_expense_app/pages/Income_Expense/income_screen.dart';
import 'package:general_expense_app/pages/Locations/item_list_screen.dart';
import 'package:intl/intl.dart';
import '../../Utils/colors.dart';
import '../../models/CommonModel/message_model.dart';
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



  MessageModel? messageModelData;

  String? Amount;
  String? Description;
  String? IncomeDate;



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

            else if(state is PostAddIncomeEventState){

              messageModelData = state.addIncomeModelData;
              loadAllHomeScreenApiCalls();

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

              ///
              /// Cards
              ///

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
                                    "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.totalBalance)).replaceAll(".00","")}",
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
                              InkWell(
                                onTap:(){
                                  bottomSheetforAddShelfItems(context);

                                },
                                child: Container(
                                    height: main_Height * 0.05,
                                    width: main_Height * 0.05,
                                    // child: SvgPicture.asset(
                                    //     "assets/images/dot.svg")
                                  alignment: Alignment.center,
                                child: Text("+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: main_Height * 0.04,
                                ),
                                ),
                                ),
                              )
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
                                            "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.totalIncome)).replaceAll(".00","")}",
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
                                            "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((dashboardModelData!.totalExpense)).replaceAll(".00","")}",
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
                        getGroupListModelData?.isEmpty == true ?  "Add Group  > " : "View All  > ",
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
              getGroupListModelData?.isEmpty == true ?
              Container(
                height: main_Height * 0.2,
                width: main_Width,
                child: Center(
                  child: Text(
                    "You don't have any Groups !",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // color: Color.fromARGB(255, 158, 158, 158),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: main_Height * 0.0239,
                    ),
                  ),
                ),
              ) :
              Container(
                height: main_Height * 0.2,
                width: main_Width,
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.025,),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0),
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
                      "Search for Items",
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
                    // autofocus: false,
                    readOnly: true,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemListScreen("","1"))).then((value){
                        // FocusManager.instance.primaryFocus?.unfocus();
                      }
                      );
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: main_Height * 0.015), // Adjust vertical padding
                      hintText: 'Search Items . . ',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemListScreen("","1")));
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>ViewallIncomeExpense()));
                      },
                      child: Text(
                        dashboardModelData?.incomeAndExpense?.isEmpty == true ? "Add Income  > "  :  "View All  > ",
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
              dashboardModelData?.incomeAndExpense?.isEmpty == true ?
              Container(
                height: main_Height * 0.2,
                width: main_Width,
                child: Center(
                  child: Text(
                    "You don't have any Income or Expense !",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // color: Color.fromARGB(255, 158, 158, 158),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: main_Height * 0.0239,
                    ),
                  ),
                ),
              ) :
              ListView.builder(
                  itemCount: dashbordFilterList!.length >= 20 ?  20 : dashbordFilterList!.length,
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




  void bottomSheetforAddShelfItems(BuildContext context){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        String? textField1Value;
        String? textField2Value;
        String? textField3Value;

        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: main_Height * 0.01,
                    ),

                    Container(
                      width: main_Width * 0.08,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                    // Text Field 1
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: main_Width * 0.03,
                          vertical: main_Height * 0.01),
                      child: Column(
                        children: [
                          SizedBox(
                            height: main_Height * 0.01,
                          ),

                          Row(
                            children: [
                              Text(
                                "Amount",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: main_Height * 0.018,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: main_Height * 0.01,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(fontSize: main_Height * 0.022),
                            onSaved: (newValue) {
                              textField1Value = newValue!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.only(top: 5, bottom: 5, left: 10),
                              // filled: true,
                              enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              // fillColor: ,
                              hintText: "Amount",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: main_Height * 0.018),
                              border: const OutlineInputBorder(

                              ),
                            ),
                          ),
                          SizedBox(
                            height: main_Height * 0.01,
                          ),


                          Row(
                            children: [
                              Text(
                                "Description",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: main_Height * 0.018,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: main_Height * 0.01,
                          ),
                          TextFormField(
                            style: TextStyle(fontSize: main_Height * 0.022),
                            onSaved: (newValue) {
                              textField2Value = newValue!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                              // filled: true,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              // fillColor: ,
                              hintText: "Description",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: main_Height * 0.018),
                              border: const OutlineInputBorder(
                                // borderSide:
                                // const BorderSide(color: Colors.white),
                                // borderRadius: BorderRadius.circular(10)

                              ),
                            ),
                          ),
                          SizedBox(
                            height: main_Height * 0.01,
                          ),

                          Row(
                            children: [
                              Text(
                                "Date & Time",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: main_Height * 0.018,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: main_Height * 0.01,
                          ),
                          DateTimePicker(
                            type: DateTimePickerType.dateTimeSeparate,
                            dateMask: 'd MMM, yyyy',
                            initialValue: DateTime.now().toString(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Date',
                            timeLabelText: "Hour",
                            selectableDayPredicate: (date) {
                              // Disable weekend days to select from the calendar
                              // if (date.weekday == 6 || date.weekday == 7) {
                              //   return false;
                              // }

                              return true;
                            },
                            // onChanged: (val){
                            //   IncomeDate = val;
                            // },
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val){
                              textField3Value = val;

                            },
                          ),
                          SizedBox(
                            height: main_Height * 0.01,
                          ),



                        ],
                      ),
                    ),
                    // Save Button
                    Container(
                      height: main_Height * 0.085,
                      width: main_Width * 1,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: 10),
                        child: Container(
                          height: main_Height * 0.06,
                          width: main_Width * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              primary: primaryPurple,
                            ),
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                print("tttf ${textField1Value} ${textField2Value} ${textField3Value}");

                                /// 2023-06-02 11:50:11.735992  NOW
                                /// 2023-06-08 06:50  change
                                /// 2023-06-08t06:50:00

                                print("${textField3Value!.length}");
                                final testdate = textField3Value.toString().length == 16 ? "${textField3Value.toString().replaceAll(" ", "T")}:00.946Z" : "${textField3Value.toString().substring(0,16).replaceAll(" ", "T")}:00.946Z";

                                print("${testdate}");
                                homeScreenBloc.add(PostAddIncomeEvent( "${testdate.toString()}","${textField1Value}","${textField2Value}",));

                                Navigator.of(context).pop();


                              }
                            },
                            child: Text("Add Income",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: main_Height * 0.018,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );


  }

}

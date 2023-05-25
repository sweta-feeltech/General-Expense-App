import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import '../../blocs/IncomeListScreen/income_list_screen_bloc.dart';
import '../../models/IncomeListModel/income_list_model.dart';
import '../../network/repository.dart';
import '../Dashboard/add_expense_screen.dart';
import '../Widgets/theme_helper.dart';
import '../Widgets/common_widgets.dart';

class ListofIncomeScreen extends StatefulWidget {
  static String routeName = '/listofIncomeScreen';

  const ListofIncomeScreen({Key? key}) : super(key: key);

  @override
  State<ListofIncomeScreen> createState() => _ListofIncomeScreenState();
}

class _ListofIncomeScreenState extends State<ListofIncomeScreen> {



  IncomeListScreenBloc incomeListScreenBloc = IncomeListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



    List<IncomeListModel>? getIncomeListModelData;


  @override
  void initState() {
    super.initState();
    loadAllIncomeListScreenApiCalls();
  }

  void loadAllIncomeListScreenApiCalls() {
    //TODO: remove static values
    incomeListScreenBloc.add(FetchAllIncomeScreenListScreenAPIsEvent());
  }




  @override
  Widget build(BuildContext context) {



    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;





    return BlocProvider<IncomeListScreenBloc>(
        create: (context) => incomeListScreenBloc..add(IncomeScreenListInitialEvent()),

        child: BlocConsumer<IncomeListScreenBloc, IncomeListScreenState>(

          builder: (context, state) {
            if(state is IncomeListScreenLoadingEventState) {

              return ThemeHelper.buildLoadingWidget();
            }
            else if(state is FetchAllIncomeListScreenAPIsEventState) {

              getIncomeListModelData = state.getIncomeListModelData;


              return mainViewAllCourseCatCourse();
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


  Widget mainViewAllCourseCatCourse(){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: primaryGrey,
      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "Income List",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),
      bottomSheet: Container(
        height: main_Height * 0.1,
        width: main_Width * 1,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: main_Height * 0.052,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                      border: Border.all(color: primaryPurple, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "ADD INCOME",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: primaryPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: main_Height * 0.015,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: main_Width * 0.028,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AddExpenseScreen.routeName);
                  },
                  child: Container(
                    height: main_Height * 0.052,
                    decoration: BoxDecoration(
                        color: primaryPurple,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "ADD EXPENSE",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          fontSize: main_Height * 0.015,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: main_Height * 0.1,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///
              /// Heading
              ///

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


                        bottomSheetforAddShelfItems(context);



                        ///
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

              ///
              ///List
              ///

              Container(
                height: main_Height * 0.735,
                child: ListView.builder(
                    itemCount: getIncomeListModelData!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CommonWidgets.CommonIncomeListView(context,
                        getIncomeListModelData: getIncomeListModelData![index]
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );

  }


  void bottomSheetforAddShelfItems(BuildContext context){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


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
          return Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),

                      )
                  ),
                  padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child:  SingleChildScrollView(
                          child: Form(
                            child: Column(
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


                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: main_Width * 0.03,
                                      vertical: main_Height * 0.01
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [


                                        Row(
                                          children: [
                                            Text(
                                              "Item Name",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: main_Height * 0.018,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          // initialValue: "${Username}",
                                          // initialValue: "${getProfileModelData?.firstName == null ? appUserData!.firstName : getProfileModelData!.firstName}",
                                          style: TextStyle(
                                            fontSize: main_Height * 0.022,
                                          ),
                                          // onSaved: (newValue) {
                                          //   firstName = newValue;
                                          // },
                                          // onChanged: (value){
                                          //   firstName = value;
                                          // },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Item Name can\'t be empty';
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
                                            hintText: "Item Name",
                                            hintStyle: TextStyle(
                                                color: Colors.grey, fontSize: main_Height * 0.018),
                                            border: const OutlineInputBorder(
                                              // borderSide:
                                              // const BorderSide(color: Colors.white),
                                              // borderRadius: BorderRadius.circular(10)

                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),



                                        Row(
                                          children: [
                                            Text(
                                              "Date Time",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: main_Height * 0.018,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        DateTimePicker(
                                          use24HourFormat: false,
                                          type: DateTimePickerType.dateTimeSeparate,
                                          decoration: InputDecoration(
                                            contentPadding:
                                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                                            // filled: true,
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black38),
                                            ),
                                            // fillColor: ,
                                            hintText: "Date of Birth",
                                            hintStyle: TextStyle(
                                                color: Colors.grey, fontSize: main_Height * 0.018),
                                            border: const OutlineInputBorder(
                                              // borderSide:
                                              //     const BorderSide(color: Colors.transparent),
                                              // borderRadius: BorderRadius.circular(10)

                                            ),
                                          ),
                                          dateMask: 'd MMM, yyyy',
                                          initialValue: DateTime.now().toString(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100),

                                          icon: Icon(Icons.event),

                                          // dateLabelText: 'Date',
                                          // timeLabelText: "Hour",
                                          selectableDayPredicate: (date) {
                                            // Disable weekend days to select from the calendar
                                            if (date.weekday == 6 || date.weekday == 7) {
                                              return false;
                                            }

                                            return true;
                                          },
                                          onChanged: (val) => print(val),
                                          validator: (val) {
                                            print(val);
                                            return null;
                                          },
                                          onSaved: (val) => print(val),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),




                                      ],
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),


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
                              onPressed: () {

                                Navigator.of(context).pop();

                              },
                              child: Text("Add Items",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: main_Height * 0.018,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )



                    ],
                  ),

                ),
              ),
            ),
          );
        }
    );

  }
}

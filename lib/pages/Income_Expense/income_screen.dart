import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import '../../blocs/IncomeListScreen/income_list_screen_bloc.dart';
import '../../models/CommonModel/message_model.dart';
import '../../models/Expense/income_list_model.dart';
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



  List<GetIncomeListModel>? getIncomeListModelData;
  List<GetIncomeListModel>? reversegetIncomeListModelData;



  MessageModel? messageModelData;

  String? Amount;
  String? Description;
  String? IncomeDate;



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

              // getIncomeListModelData = state.getIncomeListModelData.reversed.toList();
              // getIncomeListModelData = state.getIncomeListModelData;


              return mainViewAllIncomeList();
            }
            else if(state is PostAddIncomeEventState){

              messageModelData = state.addIncomeModelData;
              loadAllIncomeListScreenApiCalls();

              return mainViewAllIncomeList();

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


  Widget mainViewAllIncomeList(){

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
        centerTitle: false,
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
                child: InkWell(
                  onTap: (){
                    bottomSheetforAddShelfItems(context);

                  },
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
      body:

          getIncomeListModelData?.isEmpty == true ?
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset("assets/icons/group.svg",
                    height: main_Height * 0.4,
                  ),
                ),



                Text(
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

                        bottomSheetforAddShelfItems(context);

                      },
                      child: Text(
                        "Add Income",
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
          loadAllIncomeListScreenApiCalls();

        },
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
                    "Add Income",
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

            Expanded(
              child: ListView.builder(
                  itemCount: getIncomeListModelData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommonWidgets.CommonIncomeListView(context,
                        getIncomeListModelData: getIncomeListModelData![index]
                    );
                  }),
            ),

            SizedBox(
              height: main_Height * 0.1,

            )


          ],
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
                              incomeListScreenBloc.add(PostAddIncomeEvent( "${testdate.toString()}","${textField1Value}","${textField2Value}",));

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

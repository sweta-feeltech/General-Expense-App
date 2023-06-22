import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../Utils/colors.dart';
import '../../blocs/TransactionFilterScreen/transaction_list_screen_bloc.dart';
import '../../models/CommonModel/message_model.dart';
import '../../models/DashboardModel/dashboard_model.dart';
import '../../models/DashboardModel/transaction_filter_model.dart';
import '../../models/GroupModel/group_list_model.dart';
import '../../network/repository.dart';
import '../Widgets/nav_drawer.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';
import 'filterForTransaction.dart';

class ViewallIncomeExpense extends StatefulWidget {
  static String routeName = '/ViewallIncomeExpense';
  const ViewallIncomeExpense({Key? key}) : super(key: key);

  @override
  State<ViewallIncomeExpense> createState() => _ViewallIncomeExpenseState();
}

class _ViewallIncomeExpenseState extends State<ViewallIncomeExpense> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  TransactionListScreenBloc transactionListScreenBloc =
  TransactionListScreenBloc(Repository.getInstance());

  DateTime? todayDate;


  GetFilteredTransactionModel? getFilteredTransactionModelData;
  DashboardModel? dashboardModelData;

  String? incomeExpenseDateRange;
  PickerDateRange? incomeExpenseDateRangePicker;
  String? filtredSelectedData;
  String? globalFilterSelected;



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
    todayDate = DateTime.now();
    String convertedTodayDateToYMD = ThemeHelper.convertToYMDFormat(todayDate.toString());
    String monthStartDate = "${todayDate?.year}-${todayDate?.month}-01";
    incomeExpenseDateRange = ThemeHelper.filterRangeFormat(todayDate: todayDate);
    transactionListScreenBloc.add(FetchTransactionDataOnFilterEvent(startDate: monthStartDate,endDate: convertedTodayDateToYMD));
  }


  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<TransactionListScreenBloc>(
        create: (context) =>
        transactionListScreenBloc..add(TrnsacctionListScreenStateScreenInitialEvent()),
        child: BlocConsumer<TransactionListScreenBloc, TrnsacctionListScreenState>(
          builder: (context, state) {
            if (state is TrnsacctionListScreenStateScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchTransactionDataOnFilterEventState) {


              getFilteredTransactionModelData = state.getFilteredTransactionModelData;
              // getGroupListModelData = state.getGroupListModelData;
              // dashboardModelData = state.dashboardModelData;

              return mainViewHomeAllScreenViewWidget();
            }

            // else if(state is PostAddIncomeEventState){

            //   messageModelData = state.addIncomeModelData;
            //   loadAllHomeScreenApiCalls();

            //   return mainViewHomeAllScreenViewWidget();

            // }


            else {
              return Container();
            }
          },
          listener: (context, state) {
            if (state is ApiFailureState) {

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


    // dashboardModelData!.incomeAndExpense?.sort((a, b) => a.createdDate!.compareTo(b.createdDate!),);

    // final dashbordFilterList = dashboardModelData!.incomeAndExpense!.reversed.toList();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: primaryGrey,

        appBar: AppBar(
          titleSpacing: 15,
          title: Text(
            "View All",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          centerTitle: false,
            // actions: [
            //   IconButton(
            //     icon: Icon(
            //       Icons.add_box,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       final RenderBox appBarRenderBox =
            //       context.findRenderObject() as RenderBox;
            //       final Offset appBarOffset =
            //       appBarRenderBox.localToGlobal(Offset.zero);
            //       final Size appBarSize = appBarRenderBox.size;
            //       _showPopupMenu(context, appBarOffset, appBarSize);
            //     },
            //   ),
            // ]
        ),
      body: RefreshIndicator(
        onRefresh: ()async{
          loadAllHomeScreenApiCalls();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,vertical: main_Height * 0.01),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Last Added",
              //         style: TextStyle(
              //             letterSpacing: 1,
              //             fontSize: main_Height * 0.018,
              //             fontWeight: FontWeight.w500),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListofIncomeScreen()));
              //         },
              //         child: Text(
              //           dashboardModelData?.incomeAndExpense?.isEmpty == true ? "Add Income  > "  :  "View All  > ",
              //           maxLines: 1,
              //           overflow: TextOverflow.ellipsis,
              //           style: TextStyle(
              //               color: Colors.black,
              //               letterSpacing: 1,
              //               fontSize: main_Height * 0.016,
              //               fontWeight: FontWeight.w200),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              //


              CommonWidgets.titleAndFilterDateRageAndCustomFilterUIWidget(
                context,

                dataRangeText: incomeExpenseDateRange ?? "",

                dataPickerOnTap : () async {

                  incomeExpenseDateRangePicker = await ThemeHelper.selectDateRangeForFilter(context);

                  if (incomeExpenseDateRangePicker?.startDate != null && incomeExpenseDateRangePicker?.endDate != null) {
                    setState(() {
                      incomeExpenseDateRange = ThemeHelper.filterRangeFormat(startDate: incomeExpenseDateRangePicker?.startDate, endDate: incomeExpenseDateRangePicker?.endDate);
                    });

                    transactionListScreenBloc.add(
                        FetchTransactionDataOnFilterEvent(
                            startDate: ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.startDate.toString() ?? ""),
                            endDate: ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.endDate.toString() ?? "")
                        )
                    );

                  }
                  print("popup data: ${incomeExpenseDateRangePicker?.startDate}");
                  print("popup data: ${incomeExpenseDateRangePicker?.endDate}");
                },

                customFilterPressedFunc: () async {
                  var resultData = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (_) => StatefulBuilder(builder: (BuildContext context, setState) {
                        return SizedBox(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FilterForTransaction(preSelected: globalFilterSelected,)
                              ],
                            ),
                          ),
                        );
                      })
                  );

                  print(resultData);
                  if (resultData == "All") {
                    transactionListScreenBloc.add(
                        FetchTransactionDataOnFilterEvent(
                            startDate: incomeExpenseDateRangePicker?.startDate != null ? ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.startDate.toString() ?? "") : "${todayDate?.year}-${todayDate?.month}-01",
                            endDate: ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.endDate.toString() ?? todayDate.toString()),
                        )
                    );
                    filtredSelectedData = resultData;
                  }
                  else if(resultData == "Income") {
                    transactionListScreenBloc.add(
                        FetchTransactionDataOnFilterEvent(
                            startDate: incomeExpenseDateRangePicker?.startDate != null ? ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.startDate.toString() ?? "") : "${todayDate?.year}-${todayDate?.month}-01",
                            endDate: ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.endDate.toString() ?? todayDate.toString()),
                            filterStatus: "0"
                        )
                    );
                    filtredSelectedData = resultData;
                  }
                  else if(resultData == "Expense") {
                    transactionListScreenBloc.add(
                        FetchTransactionDataOnFilterEvent(
                            startDate: incomeExpenseDateRangePicker?.startDate != null ? ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.startDate.toString() ?? "") : "${todayDate?.year}-${todayDate?.month}-01",
                            endDate: ThemeHelper.convertToYMDFormat(incomeExpenseDateRangePicker?.endDate.toString() ?? todayDate.toString()),
                            filterStatus: "1"
                        )
                    );
                    filtredSelectedData = resultData;
                  }
                  setState(() {});
                  print("result Data: $filtredSelectedData");
                },

              ),



              ///
              /// Last Added
              ///


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
                  itemCount: getFilteredTransactionModelData?.incomeAndExpense?.length ?? 0,
                  // itemCount: dashbordFilterList.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return CommonWidgets.CommonFilterIncomeExpnseListView(context,
                      dashboardModelData: getFilteredTransactionModelData!.incomeAndExpense![index],
                    );
                  })


            ],
          ),
        ),
      ),
    );
  }


  // void _showPopupMenu(
  //     BuildContext context, Offset appBarOffset, Size appBarSize) {
  //   final popupPosition = RelativeRect.fromLTRB(
  //     appBarOffset.dx + appBarSize.width - 10,
  //     appBarOffset.dy - appBarSize.height - 10,
  //     appBarOffset.dx + appBarSize.width + 10,
  //     appBarOffset.dy - 10,
  //   );

  //   showMenu(
  //     context: context,
  //     position: popupPosition,
  //     items: [
  //       PopupMenuItem(
  //         child: Text('Add Income'),
  //         value: '1',
  //         onTap: () {},
  //       ),
  //       PopupMenuItem(
  //         child: Text('Add Expense'),
  //         value: '2',
  //         onTap: () {},
  //       ),
  //     ],
  //     elevation: 8.0,
  //   ).then((value) {
  //     if (value == '1') {
  //       // Handle selected option
  //       print('Selected: $value');
  //       bottomSheetforAddShelfItems(context);
  //     } else if (value == '2') {
  //       print('Selected: $value');
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddExpenseScreen()));

  //     }

  //   });
  // }

  // void bottomSheetforAddShelfItems(BuildContext context){

  //   double main_Width = MediaQuery.of(context).size.width;
  //   double main_Height = MediaQuery.of(context).size.height;
  //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  //   showModalBottomSheet<void>(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(20.0),
  //         topRight: Radius.circular(20.0),
  //       ),
  //     ),
  //     builder: (BuildContext context) {
  //       String? textField1Value;
  //       String? textField2Value;
  //       String? textField3Value;

  //       return Padding(
  //         padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //         child: SingleChildScrollView(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20),
  //                 topRight: Radius.circular(20),
  //               ),
  //             ),
  //             padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
  //             child: Form(
  //               key: _formKey,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   SizedBox(
  //                     height: main_Height * 0.01,
  //                   ),

  //                   Container(
  //                     width: main_Width * 0.08,
  //                     decoration: BoxDecoration(
  //                       border: Border(
  //                         top: BorderSide(
  //                           color: Colors.black,
  //                           width: 3.0,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // Text Field 1
  //                   Padding(
  //                     padding:  EdgeInsets.symmetric(
  //                         horizontal: main_Width * 0.03,
  //                         vertical: main_Height * 0.01),
  //                     child: Column(
  //                       children: [
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),

  //                         Row(
  //                           children: [
  //                             Text(
  //                               "Amount",
  //                               overflow: TextOverflow.ellipsis,
  //                               style: TextStyle(
  //                                   fontSize: main_Height * 0.018,
  //                                   fontWeight: FontWeight.w500),
  //                             )
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),
  //                         TextFormField(
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: [
  //                             FilteringTextInputFormatter.digitsOnly,
  //                           ],
  //                           style: TextStyle(fontSize: main_Height * 0.022),
  //                           onSaved: (newValue) {
  //                             textField1Value = newValue!;
  //                           },
  //                           validator: (value) {
  //                             if (value == null || value.isEmpty) {
  //                               return 'Field cannot be empty';
  //                             }
  //                             return null;
  //                           },
  //                           decoration: InputDecoration(
  //                             contentPadding:
  //                             EdgeInsets.only(top: 5, bottom: 5, left: 10),
  //                             // filled: true,
  //                             enabledBorder:  OutlineInputBorder(
  //                               borderSide: BorderSide(color: Colors.black38),
  //                             ),
  //                             // fillColor: ,
  //                             hintText: "Amount",
  //                             hintStyle: TextStyle(
  //                                 color: Colors.grey, fontSize: main_Height * 0.018),
  //                             border: const OutlineInputBorder(

  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),


  //                         Row(
  //                           children: [
  //                             Text(
  //                               "Description",
  //                               overflow: TextOverflow.ellipsis,
  //                               style: TextStyle(
  //                                   fontSize: main_Height * 0.018,
  //                                   fontWeight: FontWeight.w500),
  //                             )
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),
  //                         TextFormField(
  //                           style: TextStyle(fontSize: main_Height * 0.022),
  //                           onSaved: (newValue) {
  //                             textField2Value = newValue!;
  //                           },
  //                           validator: (value) {
  //                             if (value == null || value.isEmpty) {
  //                               return 'Field cannot be empty';
  //                             }
  //                             return null;
  //                           },
  //                           decoration: InputDecoration(
  //                             contentPadding:
  //                             const EdgeInsets.only(top: 5, bottom: 5, left: 10),
  //                             // filled: true,
  //                             enabledBorder: const OutlineInputBorder(
  //                               borderSide: BorderSide(color: Colors.black38),
  //                             ),
  //                             // fillColor: ,
  //                             hintText: "Description",
  //                             hintStyle: TextStyle(
  //                                 color: Colors.grey, fontSize: main_Height * 0.018),
  //                             border: const OutlineInputBorder(
  //                               // borderSide:
  //                               // const BorderSide(color: Colors.white),
  //                               // borderRadius: BorderRadius.circular(10)

  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),

  //                         Row(
  //                           children: [
  //                             Text(
  //                               "Date & Time",
  //                               overflow: TextOverflow.ellipsis,
  //                               style: TextStyle(
  //                                   fontSize: main_Height * 0.018,
  //                                   fontWeight: FontWeight.w500),
  //                             )
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),
  //                         DateTimePicker(
  //                           type: DateTimePickerType.dateTimeSeparate,
  //                           dateMask: 'd MMM, yyyy',
  //                           initialValue: DateTime.now().toString(),
  //                           firstDate: DateTime(2000),
  //                           lastDate: DateTime(2100),
  //                           icon: Icon(Icons.event),
  //                           dateLabelText: 'Date',
  //                           timeLabelText: "Hour",
  //                           selectableDayPredicate: (date) {
  //                             // Disable weekend days to select from the calendar
  //                             // if (date.weekday == 6 || date.weekday == 7) {
  //                             //   return false;
  //                             // }

  //                             return true;
  //                           },
  //                           // onChanged: (val){
  //                           //   IncomeDate = val;
  //                           // },
  //                           validator: (val) {
  //                             print(val);
  //                             return null;
  //                           },
  //                           onSaved: (val){
  //                             textField3Value = val;

  //                           },
  //                         ),
  //                         SizedBox(
  //                           height: main_Height * 0.01,
  //                         ),



  //                       ],
  //                     ),
  //                   ),
  //                   // Save Button
  //                   Container(
  //                     height: main_Height * 0.085,
  //                     width: main_Width * 1,
  //                     decoration: const BoxDecoration(color: Colors.white),
  //                     child: Padding(
  //                       padding:
  //                       EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: 10),
  //                       child: Container(
  //                         height: main_Height * 0.06,
  //                         width: main_Width * 0.75,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: ElevatedButton(
  //                           style: ElevatedButton.styleFrom(

  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(30),
  //                             ),
  //                             primary: primaryPurple,
  //                           ),
  //                           onPressed: (){
  //                             if (_formKey.currentState!.validate()) {
  //                               _formKey.currentState!.save();
  //                               print("tttf ${textField1Value} ${textField2Value} ${textField3Value}");

  //                               /// 2023-06-02 11:50:11.735992  NOW
  //                               /// 2023-06-08 06:50  change
  //                               /// 2023-06-08t06:50:00

  //                               print("${textField3Value!.length}");
  //                               final testdate = textField3Value.toString().length == 16 ? "${textField3Value.toString().replaceAll(" ", "T")}:00.946Z" : "${textField3Value.toString().substring(0,16).replaceAll(" ", "T")}:00.946Z";

  //                               print("${testdate}");
  //                               // homeScreenBloc.add(PostAddIncomeEvent( "${testdate.toString()}","${textField1Value}","${textField2Value}",));

  //                               Navigator.of(context).pop();


  //                             }
  //                           },
  //                           child: Text("Add Income",
  //                             style: TextStyle(
  //                                 letterSpacing: 1,
  //                                 fontSize: main_Height * 0.018,
  //                                 fontWeight: FontWeight.w500,
  //                                 color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );


  // }

}

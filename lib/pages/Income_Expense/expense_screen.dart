import 'dart:ffi';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:general_expense_app/models/DashboardModel/dashboard_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/models/Expense/get_transactions_chart_model.dart';
import 'package:general_expense_app/pages/Dashboard/add_expense_screen.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Utils/colors.dart';
import '../../blocs/IncomeListScreen/income_list_screen_bloc.dart';
import '../../models/CommonModel/message_model.dart';
import '../../models/CustomModel/chart_mothly_model.dart';
import '../../models/Expense/get_expense_list_model.dart';
import '../../models/Expense/get_transaction_chart_mode2.dart';
import '../../models/Expense/income_list_model.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';

class ExpenseScreen extends StatefulWidget {
  static String routeName = '/expenseScreen';
  Function backPressCallback;
  ExpenseScreen(this.backPressCallback, {super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  late TooltipBehavior _tooltip;

  var index1;

  IncomeListScreenBloc incomeListScreenBloc =
      IncomeListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardModel? dashboardModelData;

  // List<IncomeListModel>? getIncomeListModelData;
  List<GetIncomeListModel>? getIncomeListModelData;
  List<GetExpenseListModel>? getExpenseListModelData;

  List<GetIncomeListModel>? getIncomeListModelData2;
  List<GetExpenseListModel>? getExpenseListModelData2;





  // List<GetExpenseListModel>? getExpenseListModelData;
  GetTransactionChartModel? getTransactionChartModelData;
  GetTransactionChartModel2? getTransactionChartModel2Data;
  List<Expense>? expenseModelData;
  List<Income>? incomeModelData;


  MessageModel? messageModelData;

  late TooltipBehavior _tooltipBehavior;
  late TrackballBehavior _trackballBehavior;
  late ZoomPanBehavior? _zoomPanBehavior;

  late TooltipBehavior _tooltipBehaviorForBarGraph;
  late ZoomPanBehavior? _zoomPanBehaviorForBarGraph;

  String? Amount;
  String? Description;
  String? IncomeDate;

  var durationList = ["Weekly", "Monthly"];

  List<ChartMonthlyModel> chartMonthlyModelData = [];


  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];




  String? _durationSelected;
  String? _mothselected;
  int? selectedMonth;

  @override
  void initState() {
    loadAllIncomeListScreenApiCalls();
    index1 = 0;

    _tooltip = TooltipBehavior(enable: true);

    _trackballBehavior = ThemeHelper.trackballBehaviorDesign();

    _zoomPanBehavior = ThemeHelper.zoomPanBehaviorDesign();
    _zoomPanBehaviorForBarGraph = ThemeHelper.zoomPanBehaviorDesign();

    _tooltipBehavior = ThemeHelper.tooltipBehaviorDesign();
    _tooltipBehaviorForBarGraph = ThemeHelper.tooltipBehaviorDesign();


    for(int i = 1; i <= months.length; i++){

      chartMonthlyModelData.add(ChartMonthlyModel(i,months[i-1]));

    }


    super.initState();
  }

  void loadAllIncomeListScreenApiCalls() {
    //TODO: remove static values

    incomeListScreenBloc.add(FetchAllIncomeScreenListScreenAPIsEvent(
        chartQuery: _durationSelected == "Monthly" ? "month=$selectedMonth" :  "type=0"));
  }

  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<IncomeListScreenBloc>(
        create: (context) =>
            incomeListScreenBloc..add(IncomeScreenListInitialEvent()),
        child: BlocConsumer<IncomeListScreenBloc, IncomeListScreenState>(
          builder: (context, state) {
            if (state is IncomeListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            }
            else if (state is FetchAllIncomeListScreenAPIsEventState) {
              _durationSelected =
                  durationList[_durationSelected == "Monthly" ? 1 : 0];
              // _mothselected = "";
              // _mothselected = chartMonthlyModelData[0].monthInText;
              // getIncomeListModelData =
              //     state.getIncomeListModelData.reversed.toList();
              // getIncomeListModelData = state.getIncomeListModelData;
              //
              // getExpenseListModelData = state.getExpenseListModelData;
              // dashboardModelData = state.dashboardModelData;

              getIncomeListModelData = state.getIncomeListModelData;
              getExpenseListModelData = state.getExpenseListModelData;


              getTransactionChartModelData = state.getTransactionChartModel;
              getTransactionChartModel2Data = state.getTransactionChart2Model;
              expenseModelData = state.getTransactionChartModel.expense;
              incomeModelData = state.getTransactionChartModel.income;

              print("identify");

              // _mothselected = months[DateTime.now().month];

              selectedMonth = DateTime.now().month;

              print("mmmmmm${selectedMonth}");

              // ThemeHelper.weekwiseSingleMonthDataforIncome(incomeData2: getTransactionChartModel2Data!.income!);
              // ThemeHelper.weekwiseSingleMonthDataforExpense(expenseData2: getTransactionChartModel2Data!.expense!);
              // ThemeHelper.SevenDaysDuration(incomeData: incomeModelData);

              return mainViewAllIncomeExpenseList();
            }
              else if(state is FetchChartMonthlyEventState){

                getTransactionChartModel2Data = state.getTransactionChart2Model;

                getIncomeListModelData2 = state.getIncomeListModelData;
                getExpenseListModelData2 = state.getExpenseListModelData;

                return mainViewAllIncomeExpenseList();
            }

              else if (state is PostAddIncomeEventState) {
              messageModelData = state.addIncomeModelData;
              loadAllIncomeListScreenApiCalls();

              return mainViewAllIncomeExpenseList();
            } else {
              return Container();
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
        ));
  }

  Widget mainViewAllIncomeExpenseList() {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    print("gggggggg ${getTransactionChartModel2Data!.income!}");


    return WillPopScope(
      onWillPop: () {
        return widget.backPressCallback.call();
      },
      child: Scaffold(
        backgroundColor: primaryGrey,
        appBar: AppBar(
          titleSpacing: 15,
          title: Text(
            "Income/Expense",
            style:
                TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          centerTitle: false,
        ),

        body:  RefreshIndicator(
          onRefresh: ()async{
            loadAllIncomeListScreenApiCalls();
          },
          child: NestedScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                // SliverAppBar(
                //   expandedHeight: 0,
                //   pinned: true,
                //   flexibleSpace: FlexibleSpaceBar(
                //     title: Text(
                //       'Container',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     background: Container(
                //       color: Colors.blue,
                //     ),
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: main_Width * 0.03,
                        vertical: main_Height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  // width: main_Width * 0.4,
                                  height: main_Height * 0.11,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      color: Color(0xFFE6EBFE)),

                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Income",
                                          style: TextStyle(
                                              color:
                                              Color(0xFFAAB1CF),
                                              fontSize: main_Height *
                                                  0.015),
                                        ),
                                        SizedBox(
                                          height: main_Height * 0.01,
                                        ),
                                        Text(
                                          "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((getTransactionChartModelData?.totalIncome)).replaceAll(".00", "")}",
                                          maxLines: 1,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                              Color(0xFF677CD2),
                                              fontSize:
                                              main_Height * 0.022,
                                              fontWeight:
                                              FontWeight.w500),
                                        ),
                                      ],
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
                                onTap: () {},
                                child: Container(
                                  // width: main_Width * 0.4,
                                  height: main_Height * 0.11,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      color: Color(0xFFF6E5DC)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Expense",
                                          style: TextStyle(
                                              color:
                                              Color(0xFFD0B6A8),
                                              fontSize: main_Height *
                                                  0.015),
                                        ),
                                        SizedBox(
                                          height: main_Height * 0.01,
                                        ),
                                        Text(
                                          "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((getTransactionChartModelData!.totalExpense)).replaceAll(".00", "")}",
                                          maxLines: 1,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                              Color(0xFFE98852),
                                              fontSize: getTransactionChartModelData!
                                                  .totalExpense
                                                  .toString()
                                                  .length >=
                                                  12
                                                  ? main_Height * 0.02
                                                  : main_Height *
                                                  0.022,
                                              fontWeight:
                                              FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: main_Height * 0.015,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: main_Width * 0.03),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                    child: Text(
                                      "History",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                  ),

                                  _durationSelected == "Monthly" ?

                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38),
                                        borderRadius:
                                        BorderRadius.circular(3)),
                                    height: main_Height * 0.04,
                                    width: main_Width * 0.33,
                                    child: PopupMenuButton(
                                      itemBuilder: (context) {
                                        return chartMonthlyModelData
                                            .map((ChartMonthlyModel items) {
                                          return PopupMenuItem(
                                            child: Text(
                                              items.monthInText.toString(),

                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                  main_Height *
                                                      0.0165),
                                            ),
                                            value: items,
                                          );
                                        }).toList();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            main_Width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              _mothselected ?? "Select Month",
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                  main_Height *
                                                      0.0165),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onSelected: (ChartMonthlyModel value) {
                                        setState(() {
                                          print("valllll ${value.monthInNumber.toString()}");
                                          selectedMonth = value.monthInNumber;
                                          _mothselected = chartMonthlyModelData[value.monthInNumber! - 1].monthInText;

                                          incomeListScreenBloc.add(FetchChartMonthlyEvent(chartQuery2: "month=${selectedMonth}"));
                                          loadAllIncomeListScreenApiCalls();

                                        });
                                      },
                                    ),
                                  ) :
                                  Container(),


                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38),
                                        borderRadius:
                                        BorderRadius.circular(3)),
                                    height: main_Height * 0.04,
                                    width: main_Width * 0.3,
                                    child: PopupMenuButton(
                                      itemBuilder: (context) {
                                        return durationList
                                            .map((String items) {
                                          return PopupMenuItem(
                                            child: Text(
                                              items,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                  main_Height *
                                                      0.0165),
                                            ),
                                            value: items,
                                          );
                                        }).toList();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            main_Width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              _durationSelected!,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                  main_Height *
                                                      0.0165),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onSelected: (String value) {
                                        setState(() {
                                          _durationSelected = value;
                                          _mothselected = months[DateTime.now().month - 1];
                                          selectedMonth = DateTime.now().month;
                                          incomeListScreenBloc.add(FetchChartMonthlyEvent(chartQuery2:"month=${selectedMonth}"));
                                          loadAllIncomeListScreenApiCalls();
                                        });
                                      },
                                    ),
                                  ) ,


                                  // Container(
                                  //   height: 35,
                                  //   width: 110,
                                  //   child: DateTimePicker(
                                  //     decoration: const InputDecoration(
                                  //       contentPadding: EdgeInsets.only(
                                  //         top: 5,
                                  //         bottom: 5,
                                  //         left: 5,
                                  //       ),
                                  //       // filled: true,
                                  //       enabledBorder: OutlineInputBorder(
                                  //           borderSide: BorderSide(
                                  //               color: Colors.black)),
                                  //       // fillColor: ,
                                  //       border: OutlineInputBorder(
                                  //           borderSide: BorderSide(
                                  //               color: Colors.black)
                                  //         // borderSide:
                                  //         //     const BorderSide(color: Colors.transparent),
                                  //         // borderRadius: BorderRadius.circular(10)
                                  //
                                  //       ),
                                  //     ),
                                  //     type: DateTimePickerType.date,
                                  //     dateMask: 'dd MMM, yyyy',
                                  //     initialValue:
                                  //     "${DateTime.now().toString()}",
                                  //     firstDate: DateTime(1900),
                                  //     lastDate: DateTime.now(),
                                  //     onChanged: (val) => print(val),
                                  //     validator: (val) {
                                  //       print(val);
                                  //       return null;
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // SizedBox(
                              //   height: 300,
                              //   child: SfCartesianChart(
                              //     // enableAxisAnimation: true,
                              //     zoomPanBehavior: _zoomPanBehavior,
                              //     // enableAxisAnimation: true,
                              //     plotAreaBorderColor:
                              //         Colors.transparent,
                              //
                              //     // tooltipBehavior: _tooltipBehaviorForBarGraph,
                              //     legend: Legend(
                              //       isVisible: true,
                              //       position: LegendPosition.bottom,
                              //     ),
                              //
                              //     margin: const EdgeInsets.symmetric(
                              //         horizontal: 5),
                              //
                              //     primaryXAxis: CategoryAxis(
                              //       minimum: 0,
                              //       majorGridLines:
                              //           const MajorGridLines(
                              //               color:
                              //                   Colors.transparent),
                              //       labelStyle: TextStyle(
                              //           fontWeight: FontWeight.w500),
                              //       // visibleMaximum: ((incomeModelData?.length ?? 0) <= 7) ? 6 : 7,
                              //       // arrangeByIndex: true
                              //     ),
                              //
                              //     primaryYAxis: NumericAxis(
                              //       numberFormat:
                              //           NumberFormat.compact(),
                              //     ),
                              //
                              //     onSelectionChanged:
                              //         (selectionArgs) {
                              //       selectionArgs.selectedColor =
                              //           Colors.red;
                              //       print(selectionArgs
                              //           .viewportPointIndex);
                              //     },
                              //
                              //     series: <ChartSeries>[
                              //       /////
                              //       ///
                              //       /// TARGET PRODUCTION DATA FOR GRAPH
                              //       ///
                              //       /////
                              //       ColumnSeries<ChartData, String>(
                              //         name: "Expense",
                              //         enableTooltip: true,
                              //         legendIconType:
                              //             LegendIconType.rectangle,
                              //         dataSource: _durationSelected ==
                              //                 "Monthly"
                              //             ? ThemeHelper
                              //                 .SevenDaysDurationforExpanseMonthly(
                              //                     expenseData:
                              //                         expenseModelData)
                              //             : ThemeHelper
                              //                 .SevenDaysDurationforExpanse(
                              //                     expenseData:
                              //                         expenseModelData),
                              //         xValueMapper: (ChartData data,
                              //                 _) =>
                              //             _durationSelected ==
                              //                     "Monthly"
                              //                 ? DateFormat("dd MMM")
                              //                     .format(
                              //                         DateTime.parse(
                              //                             "${data.x}"))
                              //                 : DateFormat("EEE")
                              //                     .format(
                              //                         DateTime.parse(
                              //                             "${data.x}")),
                              //         yValueMapper:
                              //             (ChartData data, _) =>
                              //                 data.y,
                              //         borderRadius: BorderRadius.only(
                              //             topLeft:
                              //                 Radius.circular(10),
                              //             topRight:
                              //                 Radius.circular(10)),
                              //         spacing: 0.3,
                              //         width: 0.9,
                              //         dataLabelSettings:
                              //             const DataLabelSettings(),
                              //         onPointTap:
                              //             (pointInteractionDetails) {
                              //           print(pointInteractionDetails
                              //               .pointIndex);
                              //         },
                              //         color: primaryOrange,
                              //       ),
                              //       /////
                              //       ///
                              //       /// ACTUAL PRODUCTION DATA FOR GRAPH
                              //       ///
                              //       /////
                              //       ColumnSeries<ChartData, String>(
                              //         name: "Income",
                              //         legendIconType:
                              //             LegendIconType.rectangle,
                              //         dataSource: _durationSelected ==
                              //                 "Monthly"
                              //             ? ThemeHelper
                              //                 .SevenDaysDurationforIncomeMonthly(
                              //                     incomeData:
                              //                         incomeModelData)
                              //             : ThemeHelper
                              //                 .SevenDaysDurationforIncome(
                              //                     incomeData:
                              //                         incomeModelData),
                              //         xValueMapper: (ChartData data,
                              //                 _) =>
                              //             DateFormat("EEE").format(
                              //                 DateTime.parse(
                              //                     "${data.x}")),
                              //         yValueMapper:
                              //             (ChartData data, _) =>
                              //                 data.y,
                              //         borderRadius: BorderRadius.only(
                              //             topLeft:
                              //                 Radius.circular(10),
                              //             topRight:
                              //                 Radius.circular(10)),
                              //         spacing: 0.3,
                              //         width: 0.9,
                              //         color: primaryPurple,
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              getTransactionChartModel2Data != "null" ?
                              SizedBox(
                                height: main_Height * 0.35,
                                width: main_Width,
                                child: SfCartesianChart(
                                  // enableAxisAnimation: true,
                                  zoomPanBehavior: _zoomPanBehavior,
                                  // enableAxisAnimation: true,
                                  plotAreaBorderColor:
                                  Colors.transparent,

                                  // tooltipBehavior: _tooltipBehaviorForBarGraph,
                                  legend: Legend(
                                    isVisible: true,
                                    position: LegendPosition.bottom,
                                  ),

                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3),

                                  primaryXAxis: CategoryAxis(
                                    // minimum: 0,
                                    majorGridLines:
                                    const MajorGridLines(
                                        color:
                                        Colors.transparent),
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w500),

                                    // visibleMaximum: ((incomeModelData?.length ?? 0) <= 7) ? 6 : 7,
                                    // arrangeByIndex: true
                                  ),

                                  primaryYAxis: NumericAxis(
                                    numberFormat:
                                    NumberFormat.compact(),
                                  ),

                                  onSelectionChanged:
                                      (selectionArgs) {
                                    selectionArgs.selectedColor =
                                        Colors.red;
                                    print(selectionArgs
                                        .viewportPointIndex);
                                  },

                                  series: <ChartSeries>[
                                    /////
                                    ///
                                    /// TARGET PRODUCTION DATA FOR GRAPH
                                    ///
                                    /////
                                    ColumnSeries<ChartData, String>(
                                      name: "Expense",
                                      // enableTooltip: true,
                                      legendIconType:
                                      LegendIconType.rectangle,
                                      dataSource:

                                      _durationSelected == "Monthly" ?
                                      ThemeHelper.weekwiseSingleMonthDataforExpense(
                                          expenseData2:getTransactionChartModel2Data!.expense!)
                                          :
                                      ThemeHelper.SevenDaysDurationforExpanse(
                                          expenseData:
                                          expenseModelData),


                                      xValueMapper: (ChartData data,
                                          _) =>
                                      _durationSelected ==
                                          "Monthly" ?
                                      data.x  :
                                      DateFormat("EEE")
                                          .format(
                                          DateTime.parse(
                                              "${data.x}")),

                                      yValueMapper:
                                          (ChartData data, _) =>
                                      data.y,


                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                          Radius.circular(10),
                                          topRight:
                                          Radius.circular(10)),
                                      spacing: 0.3,
                                      width: 0.9,
                                      // dataLabelSettings:
                                      // const DataLabelSettings(),
                                      // onPointTap:
                                      //     (pointInteractionDetails) {
                                      //   print(pointInteractionDetails
                                      //       .pointIndex);
                                      // },
                                      color: primaryOrange,
                                    ),
                                    /////
                                    ///
                                    /// ACTUAL PRODUCTION DATA FOR GRAPH
                                    ///
                                    /////
                                    ColumnSeries<ChartData, String>(
                                      name: "Income",
                                      legendIconType:
                                      LegendIconType.rectangle,
                                      dataSource:
                                      _durationSelected ==
                                          "Monthly" ?
                                      ThemeHelper.weekwiseSingleMonthDataforIncome(
                                          incomeData2:getTransactionChartModel2Data!.income!):
                                      ThemeHelper.SevenDaysDurationforIncome(
                                          incomeData:
                                          incomeModelData),
                                      xValueMapper: (ChartData data,
                                          _) =>

                                      _durationSelected ==
                                          "Monthly" ?
                                      data.x :
                                      DateFormat("EEE").format(
                                          DateTime.parse(
                                              "${data.x}")),
                                      yValueMapper:
                                          (ChartData data, _) =>
                                      data.y,


                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                          Radius.circular(10),
                                          topRight:
                                          Radius.circular(10)),
                                      spacing: 0.3,
                                      width: 0.9,
                                      color: primaryPurple,
                                    ),
                                  ],
                                ),
                              ):
                              Container(),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: main_Height * 0.015,
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    automaticIndicatorColorAdjustment: false,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: main_Height * 0.016,
                        fontWeight: FontWeight.w500),
                    indicator: ContainerTabIndicator(
                      height: main_Height * 0.06,
                      color: primaryPurple,
                      radius: BorderRadius.circular(30),
                      padding: EdgeInsets.symmetric(
                          vertical: main_Height * 0.005,
                          horizontal: main_Width * 0.02),
                    ),
                    dividerColor: Colors.green,
                    isScrollable: false,
                    indicatorColor: Colors.green,
                    physics: NeverScrollableScrollPhysics(),
                    tabs: [
                      Tab(
                        text: 'Income',
                      ),
                      Tab(
                        text: 'Expense',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [




                    _durationSelected == "Monthly"
                    ?
                    getIncomeListModelData2?.isEmpty == true
                      ? Container(
                      color: primaryGrey,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/stupid 2.svg",

                        ),
                      ),
                    )
                          :  RefreshIndicator(
                      onRefresh: ()async{
                        loadAllIncomeListScreenApiCalls();
                      },
                            child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: getIncomeListModelData2?.length ,
                      itemBuilder:
                            (BuildContext context, int index) {
                        return CommonWidgets.CommonIncomeListView(
                              context,
                              getIncomeListModelData:
                              getIncomeListModelData2![index]);
                      }),
                          )
                      :
                  getIncomeListModelData?.isEmpty == true
                      ? Container(
                    color: primaryGrey,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/stupid 2.svg",

                      ),
                    ),
                  )
                      :  RefreshIndicator(
                    onRefresh: ()async{
                      loadAllIncomeListScreenApiCalls();
                    },
                    child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                        itemCount:  getIncomeListModelData?.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return CommonWidgets.CommonIncomeListView(
                              context,
                              getIncomeListModelData:
                              getIncomeListModelData![index]);
                        }),
                      ),

                  _durationSelected == "Monthly"
                      ?
                  getExpenseListModelData2?.isEmpty == true
                      ? Container(
                    color: primaryGrey,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/stupid 2.svg",

                      ),
                    ),
                  )
                      :  RefreshIndicator(
                    onRefresh: ()async{
                      loadAllIncomeListScreenApiCalls();
                    },
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                        itemCount:
                        getExpenseListModelData2?.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return CommonWidgets
                              .masterCategoryCardOfUI2(context, () {},
                              index: 1,
                              getExpenseListModelData:
                              getExpenseListModelData2![index] );
                        }),
                      )
                      :

                  getExpenseListModelData?.isEmpty == true
                      ? Container(
                    color: primaryGrey,
                    child: SvgPicture.asset(
                      "assets/images/stupid 2.svg",
                    ),
                  )
                      : RefreshIndicator(
                    onRefresh: ()async{
                      loadAllIncomeListScreenApiCalls();
                    },
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                        itemCount: getExpenseListModelData!.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return CommonWidgets
                              .masterCategoryCardOfUI2(context, () {},
                              index: 1,
                              getExpenseListModelData:
                              getExpenseListModelData![
                              index]);
                        }),
                      ),


                ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // body: DefaultTabController(
        //   length: 2, // Number of tabs
        //   child: Scaffold(
        //     body: NestedScrollView(
        //       headerSliverBuilder: (context, innerBoxIsScrolled) {
        //         return [
        //           SliverAppBar(
        //             flexibleSpace: FlexibleSpaceBar(
        //               background: Container(
        //                 color: primaryGrey,
        //                 child: Padding(
        //                   padding: EdgeInsets.symmetric(
        //                       horizontal: main_Width * 0.03,
        //                       vertical: main_Height * 0.02),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Expanded(
        //                             child: InkWell(
        //                               onTap: () {},
        //                               child: Container(
        //                                 // width: main_Width * 0.4,
        //                                 height: main_Height * 0.11,
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(7),
        //                                     color: Color(0xFFE6EBFE)),
        //
        //                                 child: Center(
        //                                   child: Column(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.center,
        //                                     children: [
        //                                       Text(
        //                                         "Total Income",
        //                                         style: TextStyle(
        //                                             color:
        //                                                 Color(0xFFAAB1CF),
        //                                             fontSize: main_Height *
        //                                                 0.015),
        //                                       ),
        //                                       SizedBox(
        //                                         height: main_Height * 0.01,
        //                                       ),
        //                                       Text(
        //                                         "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((getTransactionChartModelData?.totalIncome)).replaceAll(".00", "")}",
        //                                         maxLines: 1,
        //                                         overflow:
        //                                             TextOverflow.ellipsis,
        //                                         style: TextStyle(
        //                                             color:
        //                                                 Color(0xFF677CD2),
        //                                             fontSize:
        //                                                 main_Height * 0.022,
        //                                             fontWeight:
        //                                                 FontWeight.w500),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: main_Width * 0.028,
        //                           ),
        //                           Expanded(
        //                             child: InkWell(
        //                               onTap: () {},
        //                               child: Container(
        //                                 // width: main_Width * 0.4,
        //                                 height: main_Height * 0.11,
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(7),
        //                                     color: Color(0xFFF6E5DC)),
        //                                 child: Center(
        //                                   child: Column(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.center,
        //                                     children: [
        //                                       Text(
        //                                         "Total Expense",
        //                                         style: TextStyle(
        //                                             color:
        //                                                 Color(0xFFD0B6A8),
        //                                             fontSize: main_Height *
        //                                                 0.015),
        //                                       ),
        //                                       SizedBox(
        //                                         height: main_Height * 0.01,
        //                                       ),
        //                                       Text(
        //                                         "${NumberFormat.simpleCurrency(locale: 'hi-In', decimalDigits: 2).format((getTransactionChartModelData!.totalExpense)).replaceAll(".00", "")}",
        //                                         maxLines: 1,
        //                                         overflow:
        //                                             TextOverflow.ellipsis,
        //                                         style: TextStyle(
        //                                             color:
        //                                                 Color(0xFFE98852),
        //                                             fontSize: getTransactionChartModelData!
        //                                                         .totalExpense
        //                                                         .toString()
        //                                                         .length >=
        //                                                     12
        //                                                 ? main_Height * 0.02
        //                                                 : main_Height *
        //                                                     0.022,
        //                                             fontWeight:
        //                                                 FontWeight.w500),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: main_Height * 0.015,
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.symmetric(
        //                             horizontal: main_Width * 0.03),
        //                         child: Column(
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment.start,
        //                           children: [
        //                             Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 const Flexible(
        //                                   child: Text(
        //                                     "History",
        //                                     maxLines: 2,
        //                                     overflow: TextOverflow.ellipsis,
        //                                     style: TextStyle(
        //                                         fontSize: 16,
        //                                         fontWeight:
        //                                             FontWeight.w500),
        //                                   ),
        //                                 ),
        //
        //                                 _durationSelected == "Monthly" ?
        //
        //                                 Container(
        //                                   decoration: BoxDecoration(
        //                                       border: Border.all(
        //                                           color: Colors.black38),
        //                                       borderRadius:
        //                                       BorderRadius.circular(3)),
        //                                   height: main_Height * 0.04,
        //                                   width: main_Width * 0.33,
        //                                   child: PopupMenuButton(
        //                                     itemBuilder: (context) {
        //                                       return chartMonthlyModelData
        //                                           .map((ChartMonthlyModel items) {
        //                                         return PopupMenuItem(
        //                                           child: Text(
        //                                             items.monthInText.toString(),
        //
        //                                             overflow: TextOverflow
        //                                                 .ellipsis,
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize:
        //                                                 main_Height *
        //                                                     0.0165),
        //                                           ),
        //                                           value: items,
        //                                         );
        //                                       }).toList();
        //                                     },
        //                                     child: Padding(
        //                                       padding: EdgeInsets.symmetric(
        //                                           horizontal:
        //                                           main_Width * 0.02),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                         MainAxisAlignment
        //                                             .spaceBetween,
        //                                         // mainAxisSize: MainAxisSize.min,
        //                                         children: <Widget>[
        //                                           Text(
        //                                             _mothselected ?? "Select Month",
        //                                             overflow: TextOverflow
        //                                                 .ellipsis,
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize:
        //                                                 main_Height *
        //                                                     0.0165),
        //                                           ),
        //                                           Icon(
        //                                             Icons.arrow_drop_down,
        //                                             color: Colors.black,
        //                                             size: 20,
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     onSelected: (ChartMonthlyModel value) {
        //                                       setState(() {
        //                                         print("valllll ${value.monthInNumber.toString()}");
        //                                         selectedMonth = value.monthInNumber;
        //                                         _mothselected = chartMonthlyModelData[value.monthInNumber! - 1].monthInText;
        //
        //                                         incomeListScreenBloc.add(FetchChartMonthlyEvent(chartQuery2: "month=${selectedMonth}"));
        //
        //                                         // loadAllIncomeListScreenApiCalls();
        //
        //
        //                                       });
        //                                     },
        //                                   ),
        //                                 ) :
        //                                 Container(),
        //
        //
        //                                 Container(
        //                                   decoration: BoxDecoration(
        //                                       border: Border.all(
        //                                           color: Colors.black38),
        //                                       borderRadius:
        //                                       BorderRadius.circular(3)),
        //                                   height: main_Height * 0.04,
        //                                   width: main_Width * 0.3,
        //                                   child: PopupMenuButton(
        //                                     itemBuilder: (context) {
        //                                       return durationList
        //                                           .map((String items) {
        //                                         return PopupMenuItem(
        //                                           child: Text(
        //                                             items,
        //                                             overflow: TextOverflow
        //                                                 .ellipsis,
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize:
        //                                                 main_Height *
        //                                                     0.0165),
        //                                           ),
        //                                           value: items,
        //                                         );
        //                                       }).toList();
        //                                     },
        //                                     child: Padding(
        //                                       padding: EdgeInsets.symmetric(
        //                                           horizontal:
        //                                           main_Width * 0.02),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                         MainAxisAlignment
        //                                             .spaceBetween,
        //                                         // mainAxisSize: MainAxisSize.min,
        //                                         children: <Widget>[
        //                                           Text(
        //                                             _durationSelected!,
        //                                             overflow: TextOverflow
        //                                                 .ellipsis,
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize:
        //                                                 main_Height *
        //                                                     0.0165),
        //                                           ),
        //                                           Icon(
        //                                             Icons.arrow_drop_down,
        //                                             color: Colors.black,
        //                                             size: 20,
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     onSelected: (String value) {
        //                                       setState(() {
        //                                         _durationSelected = value;
        //                                         _mothselected = months[DateTime.now().month - 1];
        //                                         selectedMonth = DateTime.now().month;
        //                                         incomeListScreenBloc.add(FetchChartMonthlyEvent(chartQuery2:"month=${selectedMonth}"));
        //                                         loadAllIncomeListScreenApiCalls();
        //
        //                                       });
        //                                     },
        //                                   ),
        //                                 ) ,
        //
        //
        //                                 // Container(
        //                                 //   height: 35,
        //                                 //   width: 110,
        //                                 //   child: DateTimePicker(
        //                                 //     decoration: const InputDecoration(
        //                                 //       contentPadding: EdgeInsets.only(
        //                                 //         top: 5,
        //                                 //         bottom: 5,
        //                                 //         left: 5,
        //                                 //       ),
        //                                 //       // filled: true,
        //                                 //       enabledBorder: OutlineInputBorder(
        //                                 //           borderSide: BorderSide(
        //                                 //               color: Colors.black)),
        //                                 //       // fillColor: ,
        //                                 //       border: OutlineInputBorder(
        //                                 //           borderSide: BorderSide(
        //                                 //               color: Colors.black)
        //                                 //         // borderSide:
        //                                 //         //     const BorderSide(color: Colors.transparent),
        //                                 //         // borderRadius: BorderRadius.circular(10)
        //                                 //
        //                                 //       ),
        //                                 //     ),
        //                                 //     type: DateTimePickerType.date,
        //                                 //     dateMask: 'dd MMM, yyyy',
        //                                 //     initialValue:
        //                                 //     "${DateTime.now().toString()}",
        //                                 //     firstDate: DateTime(1900),
        //                                 //     lastDate: DateTime.now(),
        //                                 //     onChanged: (val) => print(val),
        //                                 //     validator: (val) {
        //                                 //       print(val);
        //                                 //       return null;
        //                                 //     },
        //                                 //   ),
        //                                 // ),
        //                               ],
        //                             ),
        //                             SizedBox(
        //                               height: 10,
        //                             ),
        //                             // SizedBox(
        //                             //   height: 300,
        //                             //   child: SfCartesianChart(
        //                             //     // enableAxisAnimation: true,
        //                             //     zoomPanBehavior: _zoomPanBehavior,
        //                             //     // enableAxisAnimation: true,
        //                             //     plotAreaBorderColor:
        //                             //         Colors.transparent,
        //                             //
        //                             //     // tooltipBehavior: _tooltipBehaviorForBarGraph,
        //                             //     legend: Legend(
        //                             //       isVisible: true,
        //                             //       position: LegendPosition.bottom,
        //                             //     ),
        //                             //
        //                             //     margin: const EdgeInsets.symmetric(
        //                             //         horizontal: 5),
        //                             //
        //                             //     primaryXAxis: CategoryAxis(
        //                             //       minimum: 0,
        //                             //       majorGridLines:
        //                             //           const MajorGridLines(
        //                             //               color:
        //                             //                   Colors.transparent),
        //                             //       labelStyle: TextStyle(
        //                             //           fontWeight: FontWeight.w500),
        //                             //       // visibleMaximum: ((incomeModelData?.length ?? 0) <= 7) ? 6 : 7,
        //                             //       // arrangeByIndex: true
        //                             //     ),
        //                             //
        //                             //     primaryYAxis: NumericAxis(
        //                             //       numberFormat:
        //                             //           NumberFormat.compact(),
        //                             //     ),
        //                             //
        //                             //     onSelectionChanged:
        //                             //         (selectionArgs) {
        //                             //       selectionArgs.selectedColor =
        //                             //           Colors.red;
        //                             //       print(selectionArgs
        //                             //           .viewportPointIndex);
        //                             //     },
        //                             //
        //                             //     series: <ChartSeries>[
        //                             //       /////
        //                             //       ///
        //                             //       /// TARGET PRODUCTION DATA FOR GRAPH
        //                             //       ///
        //                             //       /////
        //                             //       ColumnSeries<ChartData, String>(
        //                             //         name: "Expense",
        //                             //         enableTooltip: true,
        //                             //         legendIconType:
        //                             //             LegendIconType.rectangle,
        //                             //         dataSource: _durationSelected ==
        //                             //                 "Monthly"
        //                             //             ? ThemeHelper
        //                             //                 .SevenDaysDurationforExpanseMonthly(
        //                             //                     expenseData:
        //                             //                         expenseModelData)
        //                             //             : ThemeHelper
        //                             //                 .SevenDaysDurationforExpanse(
        //                             //                     expenseData:
        //                             //                         expenseModelData),
        //                             //         xValueMapper: (ChartData data,
        //                             //                 _) =>
        //                             //             _durationSelected ==
        //                             //                     "Monthly"
        //                             //                 ? DateFormat("dd MMM")
        //                             //                     .format(
        //                             //                         DateTime.parse(
        //                             //                             "${data.x}"))
        //                             //                 : DateFormat("EEE")
        //                             //                     .format(
        //                             //                         DateTime.parse(
        //                             //                             "${data.x}")),
        //                             //         yValueMapper:
        //                             //             (ChartData data, _) =>
        //                             //                 data.y,
        //                             //         borderRadius: BorderRadius.only(
        //                             //             topLeft:
        //                             //                 Radius.circular(10),
        //                             //             topRight:
        //                             //                 Radius.circular(10)),
        //                             //         spacing: 0.3,
        //                             //         width: 0.9,
        //                             //         dataLabelSettings:
        //                             //             const DataLabelSettings(),
        //                             //         onPointTap:
        //                             //             (pointInteractionDetails) {
        //                             //           print(pointInteractionDetails
        //                             //               .pointIndex);
        //                             //         },
        //                             //         color: primaryOrange,
        //                             //       ),
        //                             //       /////
        //                             //       ///
        //                             //       /// ACTUAL PRODUCTION DATA FOR GRAPH
        //                             //       ///
        //                             //       /////
        //                             //       ColumnSeries<ChartData, String>(
        //                             //         name: "Income",
        //                             //         legendIconType:
        //                             //             LegendIconType.rectangle,
        //                             //         dataSource: _durationSelected ==
        //                             //                 "Monthly"
        //                             //             ? ThemeHelper
        //                             //                 .SevenDaysDurationforIncomeMonthly(
        //                             //                     incomeData:
        //                             //                         incomeModelData)
        //                             //             : ThemeHelper
        //                             //                 .SevenDaysDurationforIncome(
        //                             //                     incomeData:
        //                             //                         incomeModelData),
        //                             //         xValueMapper: (ChartData data,
        //                             //                 _) =>
        //                             //             DateFormat("EEE").format(
        //                             //                 DateTime.parse(
        //                             //                     "${data.x}")),
        //                             //         yValueMapper:
        //                             //             (ChartData data, _) =>
        //                             //                 data.y,
        //                             //         borderRadius: BorderRadius.only(
        //                             //             topLeft:
        //                             //                 Radius.circular(10),
        //                             //             topRight:
        //                             //                 Radius.circular(10)),
        //                             //         spacing: 0.3,
        //                             //         width: 0.9,
        //                             //         color: primaryPurple,
        //                             //       ),
        //                             //     ],
        //                             //   ),
        //                             // ),
        //
        //                             getTransactionChartModel2Data != "null" ?
        //                             SizedBox(
        //                               height: main_Height * 0.35,
        //                               width: main_Width,
        //                               child: SfCartesianChart(
        //                                 // enableAxisAnimation: true,
        //                                 zoomPanBehavior: _zoomPanBehavior,
        //                                 // enableAxisAnimation: true,
        //                                 plotAreaBorderColor:
        //                                 Colors.transparent,
        //
        //                                 // tooltipBehavior: _tooltipBehaviorForBarGraph,
        //                                 legend: Legend(
        //                                   isVisible: true,
        //                                   position: LegendPosition.bottom,
        //                                 ),
        //
        //                                 margin: const EdgeInsets.symmetric(
        //                                     horizontal: 3),
        //
        //                                 primaryXAxis: CategoryAxis(
        //                                   // minimum: 0,
        //                                   majorGridLines:
        //                                   const MajorGridLines(
        //                                       color:
        //                                       Colors.transparent),
        //                                   labelStyle: TextStyle(
        //                                       fontWeight: FontWeight.w500),
        //
        //                                   // visibleMaximum: ((incomeModelData?.length ?? 0) <= 7) ? 6 : 7,
        //                                   // arrangeByIndex: true
        //                                 ),
        //
        //                                 primaryYAxis: NumericAxis(
        //                                   numberFormat:
        //                                   NumberFormat.compact(),
        //                                 ),
        //
        //                                 onSelectionChanged:
        //                                     (selectionArgs) {
        //                                   selectionArgs.selectedColor =
        //                                       Colors.red;
        //                                   print(selectionArgs
        //                                       .viewportPointIndex);
        //                                 },
        //
        //                                 series: <ChartSeries>[
        //                                   /////
        //                                   ///
        //                                   /// TARGET PRODUCTION DATA FOR GRAPH
        //                                   ///
        //                                   /////
        //                                   ColumnSeries<ChartData, String>(
        //                                     name: "Expense",
        //                                     // enableTooltip: true,
        //                                     legendIconType:
        //                                     LegendIconType.rectangle,
        //                                     dataSource:
        //
        //                                     _durationSelected == "Monthly" ?
        //                                     ThemeHelper.weekwiseSingleMonthDataforExpense(
        //                                         expenseData2:getTransactionChartModel2Data!.expense!)
        //                                 :
        //                                 ThemeHelper.SevenDaysDurationforExpanse(
        //                                                     expenseData:
        //                                                         expenseModelData),
        //
        //
        //                                     xValueMapper: (ChartData data,
        //                                         _) =>
        //                                                 _durationSelected ==
        //                                                         "Monthly" ?
        //                                     data.x  :
        //                                 DateFormat("EEE")
        //                                             .format(
        //                                                 DateTime.parse(
        //                                                     "${data.x}")),
        //
        //                                     yValueMapper:
        //                                         (ChartData data, _) =>
        //                                     data.y,
        //
        //
        //                                     borderRadius: BorderRadius.only(
        //                                         topLeft:
        //                                         Radius.circular(10),
        //                                         topRight:
        //                                         Radius.circular(10)),
        //                                     spacing: 0.3,
        //                                     width: 0.9,
        //                                     // dataLabelSettings:
        //                                     // const DataLabelSettings(),
        //                                     // onPointTap:
        //                                     //     (pointInteractionDetails) {
        //                                     //   print(pointInteractionDetails
        //                                     //       .pointIndex);
        //                                     // },
        //                                     color: primaryOrange,
        //                                   ),
        //                                   /////
        //                                   ///
        //                                   /// ACTUAL PRODUCTION DATA FOR GRAPH
        //                                   ///
        //                                   /////
        //                                   ColumnSeries<ChartData, String>(
        //                                     name: "Income",
        //                                     legendIconType:
        //                                     LegendIconType.rectangle,
        //                                     dataSource:
        //                                     _durationSelected ==
        //                                                         "Monthly" ?
        //                                     ThemeHelper.weekwiseSingleMonthDataforIncome(
        //                                         incomeData2:getTransactionChartModel2Data!.income!):
        //                                     ThemeHelper.SevenDaysDurationforIncome(
        //                                                         incomeData:
        //                                                             incomeModelData),
        //                                     xValueMapper: (ChartData data,
        //                                         _) =>
        //
        //                                     _durationSelected ==
        //                                                         "Monthly" ?
        //                                     data.x :
        //                                       DateFormat("EEE").format(
        //                                                     DateTime.parse(
        //                                                         "${data.x}")),
        //                                     yValueMapper:
        //                                         (ChartData data, _) =>
        //                                     data.y,
        //
        //
        //                                     borderRadius: BorderRadius.only(
        //                                         topLeft:
        //                                         Radius.circular(10),
        //                                         topRight:
        //                                         Radius.circular(10)),
        //                                     spacing: 0.3,
        //                                     width: 0.9,
        //                                     color: primaryPurple,
        //                                   ),
        //                                 ],
        //                               ),
        //                             ):
        //                             Container(),
        //
        //                           ],
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: main_Height * 0.015,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             expandedHeight: main_Height *
        //                 0.62, // Height of the app bar when expanded
        //             pinned: true,
        //             floating: true,
        //             backgroundColor: primaryGrey,
        //             bottom: TabBar(
        //               automaticIndicatorColorAdjustment: false,
        //               labelColor: Colors.white,
        //               unselectedLabelColor: Colors.black,
        //               labelStyle: TextStyle(
        //                   overflow: TextOverflow.ellipsis,
        //                   color: Colors.white,
        //                   fontSize: main_Height * 0.016,
        //                   fontWeight: FontWeight.w500),
        //               indicator: ContainerTabIndicator(
        //                 height: main_Height * 0.06,
        //                 color: primaryPurple,
        //                 radius: BorderRadius.circular(30),
        //                 padding: EdgeInsets.symmetric(
        //                     vertical: main_Height * 0.005,
        //                     horizontal: main_Width * 0.02),
        //               ),
        //               dividerColor: Colors.green,
        //               isScrollable: false,
        //               indicatorColor: Colors.green,
        //               physics: NeverScrollableScrollPhysics(),
        //               tabs: [
        //                 Tab(
        //                   text: 'Income',
        //                 ),
        //                 Tab(
        //                   text: 'Expense',
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ];
        //       },
        //       body: TabBarView(
        //         physics: NeverScrollableScrollPhysics(),
        //         children: [
        //
        //
        //
        //
        //           _durationSelected == "Monthly"
        //           ?
        //           getIncomeListModelData2?.isEmpty == true
        //               ? Container(
        //             color: primaryGrey,
        //             child: Center(
        //               child: SvgPicture.asset(
        //                 "assets/images/stupid 2.svg",
        //
        //               ),
        //             ),
        //           )
        //               :  ListView.builder(
        //             // physics: NeverScrollableScrollPhysics(),
        //               itemCount: getIncomeListModelData2?.length ,
        //               itemBuilder:
        //                   (BuildContext context, int index) {
        //                 return CommonWidgets.CommonIncomeListView(
        //                     context,
        //                     getIncomeListModelData:
        //                     getIncomeListModelData![index]);
        //               })
        //               :
        //           getIncomeListModelData?.isEmpty == true
        //               ? Container(
        //                 color: primaryGrey,
        //                 child: Center(
        //                   child: SvgPicture.asset(
        //                     "assets/images/stupid 2.svg",
        //
        //                   ),
        //                 ),
        //               )
        //               :  ListView.builder(
        //                   // physics: NeverScrollableScrollPhysics(),
        //                   itemCount:           _durationSelected == "Monthly" ? getIncomeListModelData2?.length :  getIncomeListModelData?.length,
        //                   itemBuilder:
        //                       (BuildContext context, int index) {
        //                     return CommonWidgets.CommonIncomeListView(
        //                         context,
        //                         getIncomeListModelData:
        //                         _durationSelected == "Monthly" ? getIncomeListModelData2![index] :
        //                             getIncomeListModelData![index]);
        //                   }),
        //
        //           _durationSelected == "Monthly"
        //               ?
        //           getExpenseListModelData2?.isEmpty == true
        //               ? Container(
        //             color: primaryGrey,
        //             child: Center(
        //               child: SvgPicture.asset(
        //                 "assets/images/stupid 2.svg",
        //
        //               ),
        //             ),
        //           )
        //               :  ListView.builder(
        //               itemCount:
        //               getExpenseListModelData2?.length,
        //               itemBuilder:
        //                   (BuildContext context, int index) {
        //                 return CommonWidgets
        //                     .masterCategoryCardOfUI2(context, () {},
        //                     index: 1,
        //                     getExpenseListModelData:
        //                    getExpenseListModelData2![index] );
        //               })
        //               :
        //
        //           getExpenseListModelData?.isEmpty == true
        //               ? Container(
        //                 color: primaryGrey,
        //                 child: SvgPicture.asset(
        //                   "assets/images/stupid 2.svg",
        //                 ),
        //               )
        //               : ListView.builder(
        //                   itemCount: getExpenseListModelData!.length,
        //                   itemBuilder:
        //                       (BuildContext context, int index) {
        //                     return CommonWidgets
        //                         .masterCategoryCardOfUI2(context, () {},
        //                             index: 1,
        //                             getExpenseListModelData:
        //                                 getExpenseListModelData![
        //                                     index]);
        //                   }),
        //
        //
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  void bottomSheetforAddShelfItems(BuildContext context) {
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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      padding: EdgeInsets.symmetric(
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              // fillColor: ,
                              hintText: "Amount",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: main_Height * 0.018),
                              border: const OutlineInputBorder(),
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
                              contentPadding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 10),
                              // filled: true,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              // fillColor: ,
                              hintText: "Description",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: main_Height * 0.018),
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
                            onSaved: (val) {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: main_Width * 0.05, vertical: 10),
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
                              backgroundColor: primaryPurple,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                print(
                                    "tttf ${textField1Value} ${textField2Value} ${textField3Value}");

                                /// 2023-06-02 11:50:11.735992  NOW
                                /// 2023-06-08 06:50  change
                                /// 2023-06-08t06:50:00

                                print("${textField3Value!.length}");
                                final testdate = textField3Value
                                            .toString()
                                            .length ==
                                        16
                                    ? "${textField3Value.toString().replaceAll(" ", "T")}:00.946Z"
                                    : "${textField3Value.toString().substring(0, 16).replaceAll(" ", "T")}:00.946Z";

                                print("${testdate}");
                                incomeListScreenBloc.add(PostAddIncomeEvent(
                                  "${testdate.toString()}",
                                  "${textField1Value}",
                                  "${textField2Value}",
                                ));

                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              "Add Income",
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

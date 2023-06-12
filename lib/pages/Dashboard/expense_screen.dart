import 'dart:ffi';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/add_expense_screen.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Utils/colors.dart';
import '../Income_Expense/expense_list_screen.dart';
import '../Income_Expense/income_screen.dart';

class ExpenseScreen extends StatefulWidget {
  static String routeName = '/expenseScreen';
  Function backPressCallback;
  ExpenseScreen(this.backPressCallback, {super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  var index1;

  @override
  void initState() {
    index1 = 0;

    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryGrey,

      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        centerTitle: false,
      ),

      // body: Column(
      //    children: [
      //
      //      Padding(
      //     padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.02),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Expanded(
      //           child: InkWell(
      //             onTap: (){
      //
      //             },
      //             child: Container(
      //               // width: main_Width * 0.4,
      //               height: main_Height * 0.11,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(7),
      //                   color: Color(0xFFE6EBFE)
      //               ),
      //
      //               child: Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text("Total Income",
      //                     style: TextStyle(
      //                       color: Color(0xFFAAB1CF),
      //                       fontSize: main_Height * 0.015
      //                     ),
      //                     ),
      //                     SizedBox(height: main_Height * 0.01,),
      //                     Text("\u20B97,750.00",
      //                     maxLines: 1,
      //                     overflow: TextOverflow.ellipsis,
      //                     style: TextStyle(
      //                       color: Color(0xFF677CD2),
      //                         fontSize: main_Height * 0.022,
      //                       fontWeight: FontWeight.w500
      //                     ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //
      //             ),
      //           ),
      //         ),
      //
      //         SizedBox(
      //           width: main_Width * 0.028,
      //         ),
      //
      //         Expanded(
      //           child: InkWell(
      //             onTap: (){
      //
      //
      //             },
      //             child: Container(
      //               // width: main_Width * 0.4,
      //               height: main_Height * 0.11,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(7),
      //                   color: Color(0xFFF6E5DC)
      //               ),
      //               child: Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text("Total Expense",
      //                     style: TextStyle(
      //                       color: Color(0xFFD0B6A8),
      //                         fontSize: main_Height * 0.015
      //                     ),),
      //                     SizedBox(
      //                       height: main_Height * 0.01,
      //                     ),
      //                     Text("\u20B94,390.00",
      //                       maxLines: 1,
      //                       overflow: TextOverflow.ellipsis,
      //                     style: TextStyle(
      //                       color: Color(0xFFE98852),
      //                         fontSize: main_Height * 0.022,
      //                         fontWeight: FontWeight.w500
      //                     ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //
      //             ),
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ),
      //
      //      Padding(
      // padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         const Flexible(
      //           child: Text(
      //             "Expense",
      //             maxLines: 2,
      //             overflow: TextOverflow.ellipsis,
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      //           ),
      //         ),
      //
      //         Container(
      //           height: 35,
      //           width: 110,
      //           child: DateTimePicker(
      //             decoration: const InputDecoration(
      //               contentPadding:
      //               EdgeInsets.only(top: 5, bottom: 5, left: 5, ),
      //               // filled: true,
      //               enabledBorder: OutlineInputBorder(
      //                 borderSide: BorderSide(color: Colors.black)
      //
      //               ),
      //               // fillColor: ,
      //               border: OutlineInputBorder(
      //                 borderSide: BorderSide(color: Colors.black)
      //                 // borderSide:
      //                 //     const BorderSide(color: Colors.transparent),
      //                 // borderRadius: BorderRadius.circular(10)
      //
      //               ),
      //             ),
      //             type: DateTimePickerType.date,
      //             dateMask: 'dd MMM, yyyy',
      //             initialValue: "${DateTime.now().toString()}",
      //
      //             firstDate: DateTime(1900),
      //             lastDate: DateTime.now(),
      //             onChanged: (val) => print(val),
      //             validator: (val) {
      //               print(val);
      //               return null;
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //
      //     // const SizedBox(
      //     //   height: 25,
      //     // ),
      //
      //     SizedBox(
      //       height: 300,
      //       child: SfCartesianChart(
      //         // enableAxisAnimation: true,
      //         plotAreaBorderColor: Colors.transparent,
      //         // tooltipBehavior: _tooltipBehaviorForBarGraph,
      //
      //         legend: Legend(
      //           isVisible: true,
      //           position: LegendPosition.bottom,
      //         ),
      //
      //         margin: const EdgeInsets.symmetric(horizontal: 5),
      //
      //         primaryXAxis: CategoryAxis(
      //           majorGridLines: const MajorGridLines(color: Colors.transparent),
      //           //interval: 2,
      //           labelStyle: TextStyle(
      //               fontWeight: FontWeight.w500),
      //           //visibleMinimum: ((productionChartData?.actual?.length ?? 0) <= 5) ? 0 : 5,
      //           // visibleMaximum: ((productionChartData?.actual?.length ?? 0) <= 5) ? 4 : 5,
      //         ),
      //
      //         primaryYAxis: CategoryAxis(),
      //
      //         // zoomPanBehavior: _zoomPanBehavior,
      //
      //
      //         onSelectionChanged: (selectionArgs) {
      //           selectionArgs.selectedColor = Colors.red;
      //           print(selectionArgs.viewportPointIndex);
      //         },
      //
      //         series: <ChartSeries>[
      //           /////
      //           ///
      //           /// TARGET PRODUCTION DATA FOR GRAPH
      //           ///
      //           /////
      //           ColumnSeries<_ChartData, String>(
      //             name: "Target",
      //             enableTooltip: true,
      //             // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      //             legendIconType: LegendIconType.rectangle,
      //             dataSource: data,
      //             xValueMapper: (_ChartData data, _) => data.x,
      //             yValueMapper: (_ChartData data, _) => data.y,
      //             borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      //             spacing: 0.3,
      //             width: 0.9,
      //             dataLabelSettings: const DataLabelSettings(
      //               // isVisible: true,
      //
      //             ),
      //             onPointTap: (pointInteractionDetails) {
      //               print(pointInteractionDetails.pointIndex);
      //             },
      //             color: primaryOrange,
      //           ),
      //           /////
      //           ///
      //           /// ACTUAL PRODUCTION DATA FOR GRAPH
      //           ///
      //           /////
      //           ColumnSeries<_ChartData, String>(
      //             name: "Actual",
      //             legendIconType: LegendIconType.rectangle,
      //             dataSource: data,
      //             xValueMapper: (_ChartData data, _) => data.x,
      //             yValueMapper: (_ChartData data, _) => data.y,
      //             borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      //             spacing: 0.3,
      //             width: 0.9,
      //             color: primaryPurple,
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      // ),
      //
      //      Expanded(
      //        child: ContainedTabBarView(
      //          tabBarProperties: TabBarProperties(
      //              unselectedLabelColor: Colors.black,
      //              labelColor: Color(0xFFFB1414),
      //              labelStyle: TextStyle(
      //                  overflow: TextOverflow.ellipsis,
      //                  color: Color(0xFFFB1414),
      //                  fontSize: main_Height * 0.016,
      //                  fontWeight: FontWeight.w500),
      //              indicator: ContainerTabIndicator(
      //                // color: Color(0xFFFFF3F3),
      //                  color: primaryPurple,
      //                  radius: BorderRadius.circular(30)),
      //              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
      //              background: Container(
      //                color: primaryGrey,
      //              )
      //          ),
      //          initialIndex: 0,
      //          tabs: [
      //            Container(
      //              height: double.infinity,
      //              width: double.infinity,
      //              alignment: Alignment.center,
      //              child: Padding(
      //                padding: EdgeInsets.only(top: 2),
      //                child: Text(
      //                  'Income',
      //                  maxLines: 1,
      //                  overflow: TextOverflow.ellipsis,
      //                  style: TextStyle(
      //                      color: Colors.black,
      //                      fontSize: main_Height * 0.02,
      //                      fontWeight: FontWeight.w500),
      //                ),
      //              ),
      //            ),
      //            Container(
      //              height: double.infinity,
      //              width: double.infinity,
      //              alignment: Alignment.center,
      //              child: Padding(
      //                padding: EdgeInsets.only(top: 2),
      //                child: Text(
      //                  'Expense',
      //                  overflow: TextOverflow.ellipsis,
      //                  maxLines: 1,
      //                  style: TextStyle(
      //                      color: Colors.black,
      //                      fontSize: main_Height * 0.02,
      //                      fontWeight: FontWeight.w500),
      //                ),
      //              ),
      //            ),
      //          ],
      //          views: [
      //            ListofIncomeScreen(),
      //            ListOfExpenses(),
      //          ],
      //          onChange: (index) {
      //            setState(() {
      //              index1 = index;
      //            });
      //            return print("index here :$index   jbsv ${index1}");
      //          },
      //        ),
      //      ),
      //
      //
      //   ],
      // ),

      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: main_Height * 0.02,
                  expandedHeight:
                      main_Height * 0.63, // Height of the app bar when expanded
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: primaryGrey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,vertical: main_Height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                  color: Color(0xFFAAB1CF),
                                                  fontSize:
                                                      main_Height * 0.015),
                                            ),
                                            SizedBox(
                                              height: main_Height * 0.01,
                                            ),
                                            Text(
                                              "\u20B97,750.00",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF677CD2),
                                                  fontSize: main_Height * 0.022,
                                                  fontWeight: FontWeight.w500),
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
                                                  color: Color(0xFFD0B6A8),
                                                  fontSize:
                                                      main_Height * 0.015),
                                            ),
                                            SizedBox(
                                              height: main_Height * 0.01,
                                            ),
                                            Text(
                                              "\u20B94,390.00",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFFE98852),
                                                  fontSize: main_Height * 0.022,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: main_Height * 0.015,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: main_Width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          "Expense",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 110,
                                        child: DateTimePicker(
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 5,
                                            ),
                                            // filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)),
                                            // fillColor: ,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)
                                                // borderSide:
                                                //     const BorderSide(color: Colors.transparent),
                                                // borderRadius: BorderRadius.circular(10)

                                                ),
                                          ),
                                          type: DateTimePickerType.date,
                                          dateMask: 'dd MMM, yyyy',
                                          initialValue:
                                              "${DateTime.now().toString()}",
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now(),
                                          onChanged: (val) => print(val),
                                          validator: (val) {
                                            print(val);
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  // const SizedBox(
                                  //   height: 25,
                                  // ),

                                  SizedBox(
                                    height: 300,
                                    child: SfCartesianChart(
                                      // enableAxisAnimation: true,
                                      plotAreaBorderColor: Colors.transparent,
                                      // tooltipBehavior: _tooltipBehaviorForBarGraph,

                                      legend: Legend(
                                        isVisible: true,
                                        position: LegendPosition.bottom,
                                      ),

                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),

                                      primaryXAxis: CategoryAxis(
                                        majorGridLines: const MajorGridLines(
                                            color: Colors.transparent),
                                        //interval: 2,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.w500),
                                        //visibleMinimum: ((productionChartData?.actual?.length ?? 0) <= 5) ? 0 : 5,
                                        // visibleMaximum: ((productionChartData?.actual?.length ?? 0) <= 5) ? 4 : 5,
                                      ),

                                      primaryYAxis: CategoryAxis(),

                                      // zoomPanBehavior: _zoomPanBehavior,

                                      onSelectionChanged: (selectionArgs) {
                                        selectionArgs.selectedColor = Colors.red;
                                        print(selectionArgs.viewportPointIndex);
                                      },

                                      series: <ChartSeries>[
                                        /////
                                        ///
                                        /// TARGET PRODUCTION DATA FOR GRAPH
                                        ///
                                        /////
                                        ColumnSeries<_ChartData, String>(
                                          name: "Target",
                                          enableTooltip: true,
                                          // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                          legendIconType:
                                              LegendIconType.rectangle,
                                          dataSource: data,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          spacing: 0.3,
                                          width: 0.9,
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  // isVisible: true,

                                                  ),
                                          onPointTap: (pointInteractionDetails) {
                                            print(pointInteractionDetails
                                                .pointIndex);
                                          },
                                          color: primaryOrange,
                                        ),
                                        /////
                                        ///
                                        /// ACTUAL PRODUCTION DATA FOR GRAPH
                                        ///
                                        /////
                                        ColumnSeries<_ChartData, String>(
                                          name: "Actual",
                                          legendIconType:
                                              LegendIconType.rectangle,
                                          dataSource: data,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          spacing: 0.3,
                                          width: 0.9,
                                          color: primaryPurple,
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
                    ),
                  ),
                  pinned: true,
                  floating: false,
                  backgroundColor: primaryGrey,
                  bottom: TabBar(
                    automaticIndicatorColorAdjustment: false,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color:Colors.white,
                        fontSize: main_Height * 0.016,
                        fontWeight: FontWeight.w500),
                    indicator: ContainerTabIndicator(
                        // color: Color(0xFFFFF3F3),
                        color: primaryPurple,
                        radius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    tabs: [
                      Tab(
                        text: 'Income',
                      ),
                      Tab(
                        text: 'Expense',
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListofIncomeScreen(),
                ListOfExpenses(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

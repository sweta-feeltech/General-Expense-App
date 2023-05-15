import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/add_expense_screen.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Utils/colors.dart';
import 'income_screen.dart';
import 'list_screen.dart';

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

  @override
  void initState() {
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
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.notifications_none_outlined,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Add your onPressed logic here
        //       ///for notification
        //     },
        //   ),
        // ],
        // leading: IconButton(
        //   padding: EdgeInsets.zero,
        //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
        //   onPressed: () {
        //     widget.backPressCallback.call();
        //     // Navigator.of(context).pop();
        //   },
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        // ),
        titleSpacing: 15,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
           children: [

             Padding(
            padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      // width: main_Width * 0.4,
                      height: main_Height * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFE6EBFE)
                      ),

                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Income",
                            style: TextStyle(
                              color: Color(0xFFAAB1CF),
                              fontSize: main_Height * 0.015
                            ),
                            ),
                            SizedBox(height: main_Height * 0.01,),
                            Text("\$7,750.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF677CD2),
                                fontSize: main_Height * 0.022,
                              fontWeight: FontWeight.w500
                            ),
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
                    onTap: (){


                    },
                    child: Container(
                      // width: main_Width * 0.4,
                      height: main_Height * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF6E5DC)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Expense",
                            style: TextStyle(
                              color: Color(0xFFD0B6A8),
                                fontSize: main_Height * 0.015
                            ),),
                            SizedBox(
                              height: main_Height * 0.01,
                            ),
                            Text("\$4,390.00",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFE98852),
                                fontSize: main_Height * 0.022,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),

              ],
            ),
          ),

             Padding(
        padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    "Expense",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),

                Container(
                  height: 35,
                  width: 110,
                  child: DateTimePicker(
                    decoration: const InputDecoration(
                      contentPadding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, ),
                      // filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)

                      ),
                      // fillColor: ,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                        // borderSide:
                        //     const BorderSide(color: Colors.transparent),
                        // borderRadius: BorderRadius.circular(10)

                      ),
                    ),
                    type: DateTimePickerType.date,
                    dateMask: 'dd MMM, yyyy',
                    initialValue: "${DateTime.now().toString()}",
                   
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

                margin: const EdgeInsets.symmetric(horizontal: 5),

                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(color: Colors.transparent),
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
                    legendIconType: LegendIconType.rectangle,
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    spacing: 0.3,
                    width: 0.9,
                    dataLabelSettings: const DataLabelSettings(
                      // isVisible: true,

                    ),
                    onPointTap: (pointInteractionDetails) {
                      print(pointInteractionDetails.pointIndex);
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
                    legendIconType: LegendIconType.rectangle,
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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

             Container(
              height: main_Height * 0.1,
              width: main_Width * 1,
              decoration: BoxDecoration(
                  color: Colors.transparent
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: InkWell(
                        onTap: (){

                          Navigator.of(context).pushNamed(
                              ListofIncomeScreen.routeName
                          );


                        },
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: main_Height * 0.052,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                // border: Border.all(
                                //     color: primaryPurple,
                                //     width: 1
                                // ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text("Income",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  letterSpacing: 1,
                                  color: primaryPurple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: main_Height * 0.018,
                                ),
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
                        onTap: (){
                          Navigator.of(context).pushNamed(
                              ListOfExpenses.routeName
                          );

                        },
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: main_Height * 0.052,
                            decoration: BoxDecoration(
                                color: primaryPurple,
                                // border: Border.all(
                                //   color: Colors.white,
                                //   width: 1,
                                // ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text("Expense",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  fontSize: main_Height * 0.018,
                                ),
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

             ListView.builder(
                 itemCount: 7,
                 physics: const BouncingScrollPhysics(),
                 shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                 itemBuilder: (BuildContext context, int index) {
                   return   CommonWidgets.CommonListView(context);
                 })

          ],
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

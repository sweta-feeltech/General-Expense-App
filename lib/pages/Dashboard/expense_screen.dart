import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Utils/colors.dart';
import 'list_screen.dart';

class ExpenseScreen extends StatefulWidget {
  static String routeName = 'ExpenseScreen';
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
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          onPressed: () {
            widget.backPressCallback.call();
            // Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        titleSpacing: 0,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryGrey,
        elevation: 0,
        centerTitle: true,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListOfExpenses()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      // width: main_Width * 0.4,
                      height: main_Height * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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

                  SizedBox(
                    width: main_Width * 0.028,
                  ),

                  Expanded(
                    child: Container(
                      // width: main_Width * 0.4,
                      height: main_Height * 0.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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

                ],
              ),
            ),
          ),

      SizedBox(height: 15,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),

                InkWell(
                  onTap: () async {

                  },
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5),
                    child: Row(
                      children: [
                        Container(
                          padding:const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: primaryPurple,
                                width: 1
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: -2,
                                  color: Color.fromARGB(255, 190, 190, 190),
                                  blurStyle: BlurStyle.solid
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500
                                ),
                              ),

                              SizedBox(width: 2,),

                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(minWidth: 10, minHeight: 34),
                                // constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),

                                onPressed: null,
                                disabledColor: Colors.black,
                                // icon: Icon(
                                //   Icons.calendar_month,
                                // )
                                icon: Image(image: AssetImage("assets/images/calender.png")),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                      child: Container(
                        height: main_Height * 0.052,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            // border: Border.all(
                            //     color: primaryPurple,
                            //     width: 1
                            // ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Income",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Color(0xFF959698),
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
                      child: Container(
                        height: main_Height * 0.052,
                        decoration: BoxDecoration(
                            color: primaryPurple,
                            // border: Border.all(
                            //   color: Colors.white,
                            //   width: 1,
                            // ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("EXPENSE",
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


                  ],
                ),
              ),
            ),


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


import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/models/Expense/get_transactions_chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../../models/Expense/get_transaction_chart_mode2.dart';


class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;

  @override
  String toString() {
    // TODO: implement toString
    return "x${x} : y${y}";
  }
}


class ThemeHelper {


  // static List<ChartData> weekwiseSingleMonthDataforIncome({
  //   required List<Income2> incomeData2
  // }) {
  //   List<ChartData> chartData = [];
  //
  //   double sumOfOneWeekAmount = 0;
  //
  //   if(chartData.isEmpty == true){
  //     for(int i = 0; i < 5; i++ ) {
  //       print(incomeData2.length);
  //       if(incomeData2[i].weekNumber == (i+1)) {
  //         if(incomeData2[i].incomeData?.isNotEmpty == true) {
  //           for(int j = 0; j < incomeData2[i].incomeData!.length; j++) {
  //             sumOfOneWeekAmount = sumOfOneWeekAmount + incomeData2[i].incomeData![j].totalAmount;
  //           }
  //         }
  //         print("in If section ${i}");
  //         print(("sum of Income = ${sumOfOneWeekAmount}"));
  //         chartData.add(ChartData(incomeData2[i].weekNumber.toString(), sumOfOneWeekAmount));
  //
  //       }
  //       else {
  //         print("in else section ${i}");
  //       }
  //       sumOfOneWeekAmount = 0;
  //     }
  //   }
  //
  //   print("chartData : ${chartData}");
  //
  //
  //   return chartData;
  // }

///
  ///
  ///
  ///

  static List<ChartData> weekwiseSingleMonthDataforIncome({
    required List<Income2> incomeData2
  }) {
    List<ChartData> chartData = [];

    int lengthOfApiIncomeList = 0;
    int countOfApiIncomeList = 0;

    double sumOfOneWeekAmount = 0;

    lengthOfApiIncomeList = incomeData2.length;
    countOfApiIncomeList = incomeData2.length;

    if(chartData.isEmpty == true){
      for(int i = 0; i < 5; i++ ) {

        print("jkdfhgjkhsgfd");
        print(lengthOfApiIncomeList);
        print(countOfApiIncomeList);
        print(lengthOfApiIncomeList - countOfApiIncomeList);
        if(countOfApiIncomeList != 0) {
          if(incomeData2[lengthOfApiIncomeList - countOfApiIncomeList].weekNumber == (i+1)) {
            // if(expenseData2[i].weekNumber == (i+1)) {
            if(incomeData2[lengthOfApiIncomeList - countOfApiIncomeList].incomeData?.isNotEmpty == true) {
              for(int j = 0; j < incomeData2[lengthOfApiIncomeList - countOfApiIncomeList].incomeData!.length; j++) {
                sumOfOneWeekAmount = sumOfOneWeekAmount + incomeData2[lengthOfApiIncomeList - countOfApiIncomeList].incomeData![j].totalAmount;
              }
              countOfApiIncomeList--;
            }
            print("in If section ${i}");
            print(("sum of Income = ${sumOfOneWeekAmount}"));
            print(lengthOfApiIncomeList - countOfApiIncomeList);
            chartData.add(ChartData(incomeData2[(lengthOfApiIncomeList - countOfApiIncomeList)-1].weekNumber.toString(), sumOfOneWeekAmount));

          }
          else {
            print("in else section ${i}");
            chartData.add(ChartData((i+1).toString(), 0));
          }

        }
        else {
          print("in else section ${i}");
          chartData.add(ChartData((i+1).toString(), 0));
        }
        sumOfOneWeekAmount = 0;
      }
    }

    print("chartData : ${chartData}");


    return chartData;
  }


  static List<ChartData> weekwiseSingleMonthDataforExpense({
    required List<Expense2> expenseData2
  }) {
    List<ChartData> chartData = [];

    int lengthOfApiExpenseList = 0;
    int countOfApiExpenseList = 0;

    double sumOfOneWeekAmount = 0;

    lengthOfApiExpenseList = expenseData2.length;
    countOfApiExpenseList = expenseData2.length;

    // print(expenseData2[0].expenseData);

    if(chartData.isEmpty == true){
      for(int i = 0; i < 5; i++ ) {

        print("jkdfhgjkhsgfd");
        print(lengthOfApiExpenseList);
        print(countOfApiExpenseList);
        if(countOfApiExpenseList != 0) {
          if(expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].weekNumber == (i+1)) {
            // if(expenseData2[i].weekNumber == (i+1)) {
            print(expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseData?.isNotEmpty);
            if(expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseData?.isNotEmpty == true) {
              for(int j = 0; j < expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseData!.length; j++) {
                print(expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseData![j].totalAmount);
                sumOfOneWeekAmount = sumOfOneWeekAmount + expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseData![j].totalAmount;
                print(sumOfOneWeekAmount);
              }
              countOfApiExpenseList--;
            }
            print("in If section ${i}");
            print(("sum of expense = ${sumOfOneWeekAmount}"));
            print(lengthOfApiExpenseList - countOfApiExpenseList);
            chartData.add(ChartData(expenseData2[(lengthOfApiExpenseList - countOfApiExpenseList)-1].weekNumber.toString(), sumOfOneWeekAmount));

          }
          else {
            print("in else section ${i}");
            chartData.add(ChartData((i+1).toString(), 0));
          }

        }
        else {
          print("in else section ${i}");
          chartData.add(ChartData((i+1).toString(), 0));
        }
        sumOfOneWeekAmount = 0;
      }
    }

    print("chartData : ${chartData}");


    return chartData;
  }





  ///
  ///
  ///
  /// First CODE

  // static List<ChartData> weekwiseSingleMonthDataforExpense({
  //   required List<Expense2> expenseData2
  // }) {
  //   List<ChartData> chartData = [];
  //
  //   int lengthOfApiExpenseList = 0;
  //   int countOfApiExpenseList = 0;
  //
  //   double sumOfOneWeekAmount = 0;
  //
  //   lengthOfApiExpenseList = expenseData2.length;
  //   countOfApiExpenseList = expenseData2.length;
  //
  //   print("objectdvsdfsd ${expenseData2} ");
  //
  //   if(chartData.isEmpty == true){
  //     for(int i = 0; i < 5; i++ ) {
  //
  //       print("jkdfhgjkhsgfd");
  //       print(lengthOfApiExpenseList);
  //       print(countOfApiExpenseList);
  //       if(countOfApiExpenseList != 0) {
  //         if(expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].weekNumber == (i+1)) {
  //           // if(expenseData2[i].weekNumber == (i+1)) {
  //           if(expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseDate?.isNotEmpty == true) {
  //             for(int j = 0; j < expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseDate!.length; j++) {
  //               sumOfOneWeekAmount = sumOfOneWeekAmount + expenseData2[lengthOfApiExpenseList - countOfApiExpenseList].expenseDate![j].totalAmount;
  //             }
  //             countOfApiExpenseList--;
  //           }
  //           print("in If section ${i}");
  //           print(("sum of EXPENSE = ${sumOfOneWeekAmount}"));
  //           print(lengthOfApiExpenseList - countOfApiExpenseList);
  //           chartData.add(ChartData(expenseData2[(lengthOfApiExpenseList - countOfApiExpenseList)].weekNumber.toString(), sumOfOneWeekAmount));
  //
  //         }
  //         else {
  //           print("in else section ${i}");
  //           chartData.add(ChartData((i+1).toString(), 0));
  //         }
  //
  //       }
  //       else {
  //         print("in else section ${i}");
  //         chartData.add(ChartData((i+1).toString(), 0));
  //       }
  //       sumOfOneWeekAmount = 0;
  //     }
  //   }
  //
  //   print("chartData : ${chartData}");
  //
  //
  //   return chartData;
  // }


  static List<ChartData> SevenDaysDurationforIncome(
  {
    required List<Income>? incomeData,
    }
      ){

    DateTime todayDate  = DateTime.now();

    int daysDuratin = 6;

    List<ChartData> chartData = [];


    bool isDateAvailable = false;

    double? amount;

    if(chartData.isEmpty == true){

      for(int i = 0;i <= 7; i++){

        DateTime previousDates  = todayDate.subtract(Duration(days: daysDuratin));



        incomeData?.where((data) {

          print("ddddate${data.incomeDate.toString().substring(0,10) == previousDates.toString().substring(0,10)}");
          if(data.incomeDate.toString().substring(0,10) == previousDates.toString().substring(0,10) ){

            // chartData.add(_ChartData("${data.incomeDate}",data.totalAmount));

            isDateAvailable = true;

            amount = data.totalAmount;


          }

          print("chartdatattt${chartData}");

          return true;
        } ).toList();


        if(isDateAvailable == true){
          chartData.add(ChartData("${previousDates}",amount!));
          isDateAvailable = false;
        }
        else {
          chartData.add(ChartData(previousDates.toString(),0));
          isDateAvailable = false;
        }

        daysDuratin--;

      }

    }


    return chartData;


  }

  static List<ChartData> SevenDaysDurationforIncomeMonthly(
      {
        required List<Income>? incomeData,
      }
      ){

    DateTime todayDate  = DateTime.now();

    int daysDuratin = 29;

    List<ChartData> chartData = [];


    bool isDateAvailable = false;

    double? amount;

    if(chartData.isEmpty == true){

      for(int i = 0;i <= 30; i++){

        DateTime previousDates  = todayDate.subtract(Duration(days: daysDuratin));



        incomeData?.where((data) {

          print("ddddate${data.incomeDate.toString().substring(0,10) == previousDates.toString().substring(0,10)}");
          if(data.incomeDate.toString().substring(0,10) == previousDates.toString().substring(0,10) ){

            // chartData.add(_ChartData("${data.incomeDate}",data.totalAmount));

            isDateAvailable = true;

            amount = data.totalAmount;


          }

          print("chartdatattt${chartData}");

          return true;
        } ).toList();


        if(isDateAvailable == true){
          chartData.add(ChartData("${previousDates}",amount!));
          isDateAvailable = false;
        }
        else {
          chartData.add(ChartData(previousDates.toString(),0));
          isDateAvailable = false;
        }

        daysDuratin--;

      }

    }


    return chartData;


  }




  static List<ChartData> SevenDaysDurationforExpanse(
      {
        required List<Expense>? expenseData,
      }
      ){

    DateTime todayDate  = DateTime.now();

    int daysDuratin = 6;

    List<ChartData> chartData = [];


    bool isDateAvailable = false;

    double? amount;

    if(chartData.isEmpty == true){

      for(int i = 0;i <= 7; i++){

        DateTime previousDates  = todayDate.subtract(Duration(days: daysDuratin));



        expenseData?.where((data) {

          if(data.expenseDate.toString().substring(0,10) == previousDates.toString().substring(0,10) ){

            // chartData.add(_ChartData("${data.incomeDate}",data.totalAmount));

            isDateAvailable = true;

            amount = data.totalAmount;


          }

          print("chartdatattt${chartData}");

          return true;
        } ).toList();


        if(isDateAvailable == true){
          chartData.add(ChartData("${previousDates}",amount!));
          isDateAvailable = false;
        }
        else {
          chartData.add(ChartData(previousDates.toString(),0));
          isDateAvailable = false;
        }

        daysDuratin--;

      }

    }


    return chartData;


  }

  static List<ChartData> SevenDaysDurationforExpanseMonthly(
      {
        required List<Expense>? expenseData,
      }
      ){

    DateTime todayDate  = DateTime.now();

    int daysDuratin = 29;

    List<ChartData> chartData = [];


    bool isDateAvailable = false;

    double? amount;

    if(chartData.isEmpty == true){

      for(int i = 0;i <= 30; i++){

        DateTime previousDates  = todayDate.subtract(Duration(days: daysDuratin));



        expenseData?.where((data) {

          if(data.expenseDate.toString().substring(0,10) == previousDates.toString().substring(0,10) ){

            // chartData.add(_ChartData("${data.incomeDate}",data.totalAmount));

            isDateAvailable = true;

            amount = data.totalAmount;


          }

          print("chartdatattt${chartData}");

          return true;
        } ).toList();


        if(isDateAvailable == true){
          chartData.add(ChartData("${previousDates}",amount!));
          isDateAvailable = false;
        }
        else {
          chartData.add(ChartData(previousDates.toString(),0));
          isDateAvailable = false;
        }

        daysDuratin--;

      }

    }


    return chartData;


  }








  ///
  static TooltipBehavior tooltipBehaviorDesign() {
    return TooltipBehavior(
        enable: true,
        color: Colors.white,
        opacity: 0.8,
        textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black)
    );
  }

  static ZoomPanBehavior zoomPanBehaviorDesign() {
    return ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x
    );
  }

  static TrackballBehavior trackballBehaviorDesign() {
    return TrackballBehavior(
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
      lineType: TrackballLineType.none,
      activationMode: ActivationMode.singleTap,
    );
  }
  ///


  //////
  ///
  /// THIS FUNCTION WILL USED TO SELECT DATERANGE FROM SYNCFUSION DATE PICKER
  ///
  //////
  static Future<PickerDateRange?> selectDateRangeForFilter(BuildContext context) {
    double mainWidth = MediaQuery.of(context).size.height;
    double mainHeight = MediaQuery.of(context).size.height;

    return showDialog<PickerDateRange>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Select Date Range'),
          content: SizedBox(
            height: mainHeight / 3,
            width: mainWidth,
            child: SfDateRangePicker(
              // maxDate: DateTime.now(),
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              onSubmit: (p0) {
                if (p0 != null) {
                  Navigator.of(context).pop(p0);
                } else {
                  print("date: $p0");
                }
              },
              onCancel: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        )
    );
  }

  static String filterRangeFormat({DateTime? todayDate,DateTime? startDate, DateTime? endDate}) {
    String rangeFormat =
        "${todayDate?.day != null ? '01' : startDate?.day} ${ThemeHelper.convertToMMMFormat((todayDate ?? startDate).toString())} ${(todayDate?.year ?? startDate?.year).toString().substring(2)}"
        " - "
        "${todayDate?.day ?? endDate?.day} ${ThemeHelper.convertToMMMFormat((todayDate ?? endDate).toString())} ${(todayDate?.year ?? endDate?.year).toString().substring(2)}";
    return rangeFormat;
  }


  static String convertToYMDFormat(String dateObj) {
    String yMdFormat = DateFormat("yyyy-MM-dd").format(DateTime.parse(dateObj));
    return yMdFormat;
  }

  static String convertToMMMFormat(String dateObj) {
    String MMMFormat = DateFormat("MMM").format(DateTime.parse(dateObj));
    return MMMFormat;
  }


  static UnderlineInputBorder myInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.grey,
            // color: Color.fromARGB(70, 78, 78, 78),
            width: 1.5
        )
    );
  }

  static UnderlineInputBorder signupMyInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
          // color: darkGrey,
            color: Color.fromARGB(70, 78, 78, 78),
            width: 1.5
        )
    );
  }

  static UnderlineInputBorder myFocusedBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black,
            width: 2
        )
    );
  }

  static UnderlineInputBorder signupMyFocusedBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: primaryPurple,
            width: 2
        )
    );
  }

  static UnderlineInputBorder myDisabledFieldBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
          // color: darkGrey,
            color: Color.fromARGB(70, 78, 78, 78),
            width: 1
        )
    );
  }

  static Widget buildLoadingWidget() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void addRoomDialogBox(
    {
      required BuildContext context, 
      required VoidCallback logoutPress, 
      required double heightData,
      required String popupTitle,
      required String popupcontent, 
    }
  ) {
    showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Color.fromARGB(255, 217, 231, 250),
                      color: Colors.white,
                    ),
                    height: main_Height * 0.34,
                    width: main_Width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),

                          Text(
                            popupTitle,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 10,),
                          // SizedBox(height: main_Height * 0.0235,),
                          // Image(image: AssetImage("assets/images/logout_reverse.png"), width: 30, height: 30,),

                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Enter a Room name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),
                          SizedBox(height: main_Height * 0.0135,),


                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Description",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),

                          // Text(popupcontent,
                          // textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: main_Height * 0.021
                          //   ),
                          // ),
                          SizedBox(height: main_Height * 0.0235,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                  ),
                                  child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                              ),
                              SizedBox(width: 5,),

                              SizedBox(
                                width: 75,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                        backgroundColor: MaterialStateProperty.all(primaryPurple)
                                    ),
                                    onPressed: logoutPress,
                                    child: Text("Add",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: main_Height * 0.01872,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                    top: -35,
                    child: Material(
                      borderRadius: BorderRadius.circular(60),
                      // elevation: 4,
                      // elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: CircleAvatar(
                          // backgroundColor: Colors.white,
                            backgroundColor: primaryPurple,
                            radius: 35,
                            // child: Icon(Icons.home, size: 35,)
                            child: Icon(Icons.meeting_room,color: Colors.white, size: 40,)
                          // child: Image.asset("assets/images/app_icon_png.png", width: 80, height: 80,)
                        ),
                      ),
                    )
                )
              ],
            ),
          );
        }
    );
  }

  static void addHomeDialogBox(
      {
        required BuildContext context,
        required VoidCallback logoutPress,
        required double heightData,
        required String popupTitle,
        required String popupcontent,
      }
      ) {
    showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Color.fromARGB(255, 217, 231, 250),
                      color: Colors.white,
                    ),
                    height: main_Height * 0.34,
                    width: main_Width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),

                          Text(
                            popupTitle,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 10,),
                          // SizedBox(height: main_Height * 0.0235,),
                          // Image(image: AssetImage("assets/images/logout_reverse.png"), width: 30, height: 30,),

                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Enter a Home name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),
                          SizedBox(height: main_Height * 0.0135,),


                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Description",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),

                          // Text(popupcontent,
                          // textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: main_Height * 0.021
                          //   ),
                          // ),
                          SizedBox(height: main_Height * 0.0235,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                  ),
                                  child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                              ),
                              SizedBox(width: 5,),

                              SizedBox(
                                width: 75,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                        backgroundColor: MaterialStateProperty.all(primaryPurple)
                                    ),
                                    onPressed: logoutPress,
                                    child: Text("Add",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: main_Height * 0.01872,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                    top: -35,
                    child: Material(
                      borderRadius: BorderRadius.circular(60),
                      // elevation: 4,
                      // elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: CircleAvatar(
                          // backgroundColor: Colors.white,
                            backgroundColor: primaryPurple,
                            radius: 35,
                            // child: Icon(Icons.home, size: 35,)
                            child: Icon(Icons.home,color: Colors.white, size: 40,)
                          // child: Image.asset("assets/images/app_icon_png.png", width: 80, height: 80,)
                        ),
                      ),
                    )
                )
              ],
            ),
          );
        }
    );
  }

  static void addShelfDialogBox(
      {
        required BuildContext context,
        required VoidCallback logoutPress,
        required double heightData,
        required String popupTitle,
        required String popupcontent,
      }
      ) {
    showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Color.fromARGB(255, 217, 231, 250),
                      color: Colors.white,
                    ),
                    height: main_Height * 0.34,
                    width: main_Width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),

                          Text(
                            popupTitle,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 10,),
                          // SizedBox(height: main_Height * 0.0235,),
                          // Image(image: AssetImage("assets/images/logout_reverse.png"), width: 30, height: 30,),

                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Shelf Name can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Enter a Shelf name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),
                          SizedBox(height: main_Height * 0.0135,),


                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Shelf Name can\'t be empty';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Description",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),

                          // Text(popupcontent,
                          // textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: main_Height * 0.021
                          //   ),
                          // ),
                          SizedBox(height: main_Height * 0.0235,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                  ),
                                  child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                              ),
                              SizedBox(width: 5,),

                              SizedBox(
                                width: 75,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                        backgroundColor: MaterialStateProperty.all(primaryPurple)
                                    ),
                                    onPressed: logoutPress,
                                    child: Text("Add",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: main_Height * 0.01872,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                    top: -35,
                    child: Material(
                      borderRadius: BorderRadius.circular(60),
                      // elevation: 4,
                      // elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: CircleAvatar(
                          // backgroundColor: Colors.white,
                            backgroundColor: primaryPurple,
                            radius: 35,
                            // child: Icon(Icons.home, size: 35,)
                            child: Icon(Icons.night_shelter_outlined,color: Colors.white, size: 40,)
                          // child: Image.asset("assets/images/app_icon_png.png", width: 80, height: 80,)
                        ),
                      ),
                    )
                )
              ],
            ),
          );
        }
    );
  }



  static void customDialogForMessage(
      BuildContext context,
      String dialogTitle,
      double widthData,
      VoidCallback onOkayPress,
      {
        bool? autoRemoveDialog,
        required bool ForSuccess,
        InlineSpan? contentMessage,
        // double? heightData,
        bool? needMoreLines,
        bool? isBarrierDismissible,
      }
      ) {
    showDialog(
        barrierDismissible: isBarrierDismissible ?? true,
        context: context,
        builder: (context) {
          autoRemoveDialog == true
              ? Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          })
              : null ;


          var main_Width = MediaQuery.of(context).size.width;
          var main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,

              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color.fromARGB(255, 217, 231, 250),
                    color: Colors.white,
                  ),
                  width: widthData,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            dialogTitle.trim(),
                            maxLines: needMoreLines == true ? 4 :  2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: primaryPurple,
                                // color: darkRed,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        contentMessage != null
                            ? RichText(
                          text: contentMessage,
                          textAlign: TextAlign.center,
                        )
                            : Container(),
                        SizedBox(height: main_Height * 0.0235,),
                        TextButton(
                            onPressed: onOkayPress,
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 57, 181, 74))
                                backgroundColor: MaterialStateProperty.all<Color>(primaryPurple)
                            ),
                            child: Text("OK", style: TextStyle(
                              color: Colors.white, fontSize: 14,),
                            )
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                    top: -30,
                    // top: -50,
                    child: Material(
                      borderRadius: BorderRadius.circular(60),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          // child: Image.asset("assets/images/app_icon_png.png", width: 60, height: 60,)
                          child: Container(
                            // padding: EdgeInsets.all(2),
                            child: ForSuccess ? Image.asset("assets/images/popup_success.png", width: 250, height: 250,) : Image.asset("assets/images/popup_failure.png", width: 250, height: 250,),
                          )
                      ),
                    )
                )
              ],
            ),
          );
        }
    );
  }



  static void showToastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
    );
  }



  static void addGroupDialogBox(
      {
        required BuildContext context,
        required VoidCallback logoutPress,
        required double heightData,
        required String popupTitle,
        required String popupTitle2,
        required String GroupName,
        required String Description,
        required String popupcontent,
      }
      ) {
    showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          final GlobalKey<FormState> _formkey = GlobalKey<FormState>();



          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formkey,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Color.fromARGB(255, 217, 231, 250),
                        color: Colors.white,
                      ),
                      height: main_Height * 0.22,
                      width: main_Width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),


                            Text(
                              popupTitle,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),
                            ),

                            TextFormField(
                                onSaved: (onSavedVal) {
                                  // firstName = onSavedVal;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Group Name can\'t be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  hintText: "Enter a Group name",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: darkGrey,
                                      fontSize: main_Height * 0.018),
                                  contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 0),
                                  enabledBorder:
                                  ThemeHelper.signupMyInputBorder(),
                                  constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                  focusedBorder:
                                  ThemeHelper.signupMyFocusedBorder(),
                                ),
                                textInputAction: TextInputAction.next
                            ),


                            Text(
                              popupTitle2,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),
                            ),

                            TextFormField(
                                onSaved: (onSavedVal) {
                                  // firstName = onSavedVal;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Group Name can\'t be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  hintText: "Enter a Group name",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: darkGrey,
                                      fontSize: main_Height * 0.018),
                                  contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 0),
                                  enabledBorder:
                                  ThemeHelper.signupMyInputBorder(),
                                  constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                  focusedBorder:
                                  ThemeHelper.signupMyFocusedBorder(),
                                ),
                                textInputAction: TextInputAction.next
                            ),

                            SizedBox(height: main_Height * 0.0235,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                    ),
                                    child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                                ),
                                SizedBox(width: 5,),

                                SizedBox(
                                  width: 75,
                                  child: TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                          backgroundColor: MaterialStateProperty.all(primaryPurple)
                                      ),
                                      onPressed: logoutPress,
                                      child: Text("Add",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: main_Height * 0.01872,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }



  static void advanceCustomLogoutAlert({
    required BuildContext context,
    required VoidCallback logoutPress,
    required double heightData,
    required String popupTitle,
    required String popupcontent,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    height: main_Height * 0.2,
                    width: main_Width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            popupcontent,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: main_Height * 0.021),
                          ),
                          SizedBox(
                            height: main_Height * 0.0235,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: main_Width * 0.2,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                side: BorderSide(
                                                    color: primaryPurple)))),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: main_Height * 0.01872,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: main_Width * 0.2,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                side: BorderSide(
                                                    color: Colors.white))),
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            primaryPurple)),
                                    onPressed: logoutPress,
                                    child: Text(
                                      "Logout",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: main_Height * 0.01872,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }



  static Widget mainMobileTextFormField(
      double fieldHeight,
      String hintTxt,
      final void Function(String? val)? onSaveFunc,
      IconData preFixIcon,
      TextInputAction isNextOrDone, {
        final String? Function(String? val)? validatingFunc,
        String? initalTxt,
        bool? isObsecure,
        final void Function(String? val)? onChangeFunc,
        IconData? sufFixIcon,
        final void Function()? onSufIconPress,
        final int? maxCharLength,
        final TextInputType? keyboardType,
        final bool? isReadOnly,
        final bool? isEnabled,
        required BuildContext context
      }) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return TextFormField(
        keyboardType: keyboardType,
        readOnly: isReadOnly ?? false,
        enabled: isEnabled ?? true,
        initialValue: initalTxt ?? null,
        maxLength: maxCharLength ?? null,
        style: TextStyle(
          fontSize: fieldHeight,
        ),
        obscureText: isObsecure ?? false,
        onSaved: onSaveFunc,
        onChanged: onChangeFunc,
        validator: validatingFunc,
        decoration: InputDecoration(
          counterText: "",
          floatingLabelBehavior: FloatingLabelBehavior.never,

          hintText: hintTxt,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: darkGrey,
          ),

          prefixIcon: SizedBox(
              width: 5,
              height: 5,
              child: IconButton(
                icon: Icon(
                  preFixIcon,
                  size: main_Height * 0.03,
                  color: primaryPurple,
                ),
                onPressed: null,
                alignment: Alignment.bottomLeft,
              )),

          suffixIcon: SizedBox(
            height: 5,
            width: 5,
            child: IconButton(
              icon: Icon(
                sufFixIcon,
                color: primaryPurple,
                size: main_Height * 0.03,
              ),
              onPressed: onSufIconPress,
              alignment: Alignment.bottomRight,
            ),
          ),
          contentPadding: EdgeInsets.only(top: 18, bottom: 0),
          enabledBorder: ThemeHelper.signupMyInputBorder(),
          focusedBorder: ThemeHelper.signupMyFocusedBorder(),
          disabledBorder: ThemeHelper.myDisabledFieldBorder(),
          errorStyle: TextStyle(color: Colors.redAccent),
        ),
        textInputAction: isNextOrDone);
  }




  static void toastForAPIFaliure(String message) {

    Fluttertoast.showToast(
        msg: "${message.toString().replaceAll("Exception:","").replaceAll(":","")}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }




  static void bottomSheetforAddItems(BuildContext context){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


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
      return Padding(
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
                            height: main_Height * 0.02,
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
                            child: Column(
                              children: [


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
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'First Name can\'t be empty';
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
                                    hintText: "Amount",
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
                                      "To Pay",
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
                                      return 'First Name can\'t be empty';
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
                                    hintText: "To Pay",
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
                                    // if (date.weekday == 6 || date.weekday == 7) {
                                    //   return false;
                                    // }

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
                        child: Text("Update",
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
      );
    }
        );

  }


  static void bottomSheetforAddShelfItems(BuildContext context){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    String? _selectedOption;

    List<String> _options = [
      'Category 1',
      'Category 2',
      'Category 3',
      'Category 4'
    ];

    @override
    void initState() {
      _selectedOption = _options[0];
      // set initial value to the first option
    }

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
          return Padding(
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
                                            "Category",
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
                                      Container(
                                          width: main_Width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.black38,
                                              ),
                                              borderRadius: BorderRadius.circular(3)),
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: _selectedOption,
                                              onChanged: (newValue) {
                                                // setState(() {
                                                //   _selectedOption = newValue!;
                                                // });
                                              },
                                              items: _options.map((String option) {
                                                return DropdownMenuItem<String>(
                                                  value: option,
                                                  child: Text(
                                                    option,
                                                    selectionColor: Colors.black,
                                                  ),
                                                );
                                              }).toList(),
                                              underline: null,
                                            ),
                                          )
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
                                          // if (date.weekday == 6 || date.weekday == 7) {
                                          //   return false;
                                          // }

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
          );
        }
    );

  }





}

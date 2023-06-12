import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';

import '../../blocs/ExpenseScreen/expense_screen_bloc.dart';
import '../../models/Expense/get_expense_list_model.dart';
import '../../network/repository.dart';
import '../Dashboard/add_expense_screen.dart';
import '../Widgets/theme_helper.dart';


class ListOfExpenses extends StatefulWidget {
  static String routeName = '/listOfExpenses';
  const ListOfExpenses({Key? key}) : super(key: key);

  @override
  State<ListOfExpenses> createState() => _ListOfExpensesState();
}

class _ListOfExpensesState extends State<ListOfExpenses> {

   List<GetExpenseListModel>? getExpenseListModelData;

   @override
   void initState() {
     super.initState();

     loadAllExpenseListScreenApiCalls();
   }

   ExpenseScreenBloc expenseListScreenBloc =
   ExpenseScreenBloc(Repository.getInstance());


   loadAllExpenseListScreenApiCalls() {
     expenseListScreenBloc.add(FetchAllExpenseScreenListScreenAPIsEvent());
   }



   @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<ExpenseScreenBloc>(
        create: (context) =>
        expenseListScreenBloc..add(ExpenseScreenListInitialEvent()),
        child: BlocConsumer<ExpenseScreenBloc, ExpenseScreenState>(
          builder: (context, state) {
            if (state is ExpenseScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllExpenseListScreenAPIsEventState) {
              getExpenseListModelData = state.getExpenseListModelData;

              return mainViewAllExpenseScreenViewWidget();
            }
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
                loadAllExpenseListScreenApiCalls();
              }, ForSuccess: false);
            }
          },
        ));



  }




  Widget mainViewAllExpenseScreenViewWidget(){

    double main_Height = MediaQuery.of(context).size.height;

    double main_Width = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: primaryGrey,
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.notifications_none_outlined,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         // Add your onPressed logic here
      //         ///for notification
      //       },
      //     ),
      //   ],
      //   // leading: IconButton(
      //   //   padding: EdgeInsets.zero,
      //   //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
      //   //   onPressed: () {
      //   //     // widget.backPressCallback.call();
      //   //     Navigator.of(context).pop();
      //   //   },
      //   //   icon: const Icon(Icons.arrow_back, color: Colors.black),
      //   // ),
      //   titleSpacing: 15,
      //   title: Text(
      //     "Expense List",
      //     style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: primaryPurple,
      //   elevation: 0,
      //   centerTitle: false,
      // ),
      // bottomSheet: Container(
      //   height: main_Height * 0.1,
      //   width: main_Width * 1,
      //   decoration: BoxDecoration(
      //       color: Colors.white
      //   ),
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //
      //         Expanded(
      //           child: Container(
      //             height: main_Height * 0.052,
      //             decoration: BoxDecoration(
      //               // color: Colors.green,
      //                 border: Border.all(
      //                     color: primaryPurple,
      //                     width: 1
      //                 ),
      //                 borderRadius: BorderRadius.circular(30)
      //             ),
      //             child: Center(
      //               child: Text("ADD INCOME",
      //                 maxLines: 1,
      //                 overflow: TextOverflow.ellipsis,
      //                 style: TextStyle(
      //                   letterSpacing: 1,
      //                   color: primaryPurple,
      //                   fontWeight: FontWeight.w600,
      //                   fontSize: main_Height * 0.015,
      //                 ),
      //               ),
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
      //               Navigator.of(context).pushNamed(
      //                   AddExpenseScreen.routeName
      //               );
      //
      //             },
      //             child: Container(
      //               height: main_Height * 0.052,
      //               decoration: BoxDecoration(
      //                   color: primaryPurple,
      //                   border: Border.all(
      //                     color: Colors.white,
      //                     width: 1,
      //                   ),
      //                   borderRadius: BorderRadius.circular(30)
      //               ),
      //               child: Center(
      //                 child: Text("ADD EXPENSE",
      //                   maxLines: 1,
      //                   overflow: TextOverflow.ellipsis,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.w600,
      //                     letterSpacing: 1,
      //                     fontSize: main_Height * 0.015,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //
      //
      //       ],
      //     ),
      //   ),
      // ),

      body: getExpenseListModelData?.isEmpty == true ?
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
                  "You don't have any Expenses !",
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
                        Navigator.of(context).pushNamed(AddExpenseScreen.routeName);

                      },
                      child: Text(
                        "Add Expense",
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
        onRefresh: ()async{
          loadAllExpenseListScreenApiCalls();
        },
        child: ListView.builder(
            itemCount: getExpenseListModelData!.length,
            itemBuilder: (BuildContext context, int index) {
              return   CommonWidgets.masterCategoryCardOfUI2(context,
                      () {},
                  index: 1,
                  getExpenseListModelData: getExpenseListModelData![index]
              );

            }),
      )
      // RefreshIndicator(
      //   onRefresh: () async {
      //     loadAllExpenseListScreenApiCalls();
      //   },
      //   child: Column(
      //     children: [
      //
      //       ///
      //       /// Heading
      //       ///
      //
      //       Padding(
      //         padding: EdgeInsets.symmetric(
      //             horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Flexible(
      //               child: Text(
      //                 "Add Expense",
      //                 maxLines: 1,
      //                 overflow: TextOverflow.ellipsis,
      //                 style: TextStyle(
      //                     letterSpacing: 1,
      //                     fontSize: main_Height * 0.021,
      //                     fontWeight: FontWeight.w500),
      //               ),
      //             ),
      //             InkWell(
      //               onTap: () {
      //
      //                 Navigator.of(context).pushNamed(AddExpenseScreen.routeName);
      //
      //                 ///
      //               },
      //               child: Container(
      //                 height: main_Height * 0.05,
      //                 width: main_Height * 0.05,
      //                 child: SvgPicture.asset(
      //                   "assets/images/add.svg",
      //                   fit: BoxFit.fill,
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //
      //       ///
      //       ///List
      //       ///
      //
      //       Expanded(
      //         child: ListView.builder(
      //             itemCount: getExpenseListModelData!.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               return   CommonWidgets.masterCategoryCardOfUI2(context,
      //                       () {},
      //                   index: 1,
      //                 getExpenseListModelData: getExpenseListModelData![index]
      //               );
      //
      //             }),
      //       ),
      //
      //
      //       SizedBox(
      //         height: main_Height * 0.1,
      //       )
      //
      //
      //     ],
      //   ),
      // ),

    );

  }



}

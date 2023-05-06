import 'package:flutter/material.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';

import '../../Utils/colors.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryGrey,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          onPressed: () {
            // widget.backPressCallback.call();
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
    );
  }
}

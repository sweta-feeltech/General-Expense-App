import 'package:flutter/material.dart';

import '../../Utils/colors.dart';


class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrey,

      appBar: AppBar(
        title: Text("Income Expense"),
      ),

    );
  }
}

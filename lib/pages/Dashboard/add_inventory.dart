import 'package:flutter/material.dart';

import '../../Utils/colors.dart';


class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({Key? key}) : super(key: key);

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrey,

      appBar: AppBar(
        title: Text("Add Inventory"),
      ),

    );
  }
}

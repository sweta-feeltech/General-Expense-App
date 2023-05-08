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

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: primaryGrey,
        appBar: AppBar(
          // leading: IconButton(
          //   padding: EdgeInsets.zero,
          //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
          //   onPressed: () {
          //     // widget.backPressCallback.call();
          //     Navigator.of(context).pop();
          //   },
          //   icon: Icon(Icons.arrow_back, color: Colors.black),
          // ),
          titleSpacing: 15,
          title: Text(
            "Add Inventory",
            style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryGrey,
          elevation: 0,
          // centerTitle: true,
        ),


      body: Column(
        children: [


        ],
      ),

    );
  }
}

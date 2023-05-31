import 'package:flutter/material.dart';

import '../../Utils/colors.dart';


class AddInventoryScreen extends StatefulWidget {
  static String routeName = 'addInventoryScreen';
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
          titleSpacing: 15,
          title: Text(
            "Add Inventory",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          centerTitle: false,
        ),


      body: Column(
        children: [





        ],
      ),

    );
  }
}

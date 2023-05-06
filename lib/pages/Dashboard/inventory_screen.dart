import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class InventoryScreen extends StatefulWidget {
  static String routeName = 'InventoryScreen';
  Function backPressCallback;
  InventoryScreen(this.backPressCallback,{super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
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
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
        titleSpacing: 0,
        title: Text(
          "Home",
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

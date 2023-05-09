import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import 'common_widgets.dart';


class InventoryScreen2 extends StatefulWidget {
  const InventoryScreen2({Key? key}) : super(key: key);

  @override
  State<InventoryScreen2> createState() => _InventoryScreen2State();
}

class _InventoryScreen2State extends State<InventoryScreen2> {



  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return Scaffold(

      appBar: AppBar(
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
          "Shelf1",
          style: TextStyle(color: Colors.black, fontSize: main_Height * 0.025),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),

      body:   ListView.builder(
          itemCount: 25,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return CommonWidgets.CommonShelfListView(context);
          }),





    );
  }
}

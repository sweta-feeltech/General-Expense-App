import 'package:flutter/material.dart';

import '../../Utils/colors.dart';


class CategoryScreen extends StatefulWidget {
  static String routeName = '/CategoryScreen';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: primaryGrey,

      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "CategoryScreen",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),


    );
  }
}

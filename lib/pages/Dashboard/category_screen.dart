import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import 'common_widgets.dart';


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




      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Category",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: main_Height * 0.021,
                      fontWeight: FontWeight.w500
                  ),
                ),

                InkWell(
                  onTap: (){


                  },
                  child: Container(
                    height: main_Height * 0.05,
                    width: main_Height * 0.05,
                    child: SvgPicture.asset("assets/images/add.svg",
                      fit: BoxFit.fill,),
                  ),
                )


              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: 25,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return CommonWidgets.masterCategoryCardOfUI(context,index: index);
                }),
          ),



        ],
      ),


    );
  }
}

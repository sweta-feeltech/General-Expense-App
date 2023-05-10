import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';


class AddExpenseScreen extends StatefulWidget {

  static String routeName = '/addExpenseScreen';

  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;



    return Scaffold(

        appBar: AppBar(
          titleSpacing: 15,
          title: Text(
            "Add Expense",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          // centerTitle: true,
        ),




          body: SingleChildScrollView(
            child: Column(
              children: [


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add Expense",
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


                Padding(padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text("Amount",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    TextFormField(
                      // initialValue: "${Username}",
                      // initialValue: "${getProfileModelData?.firstName == null ? appUserData!.firstName : getProfileModelData!.firstName}",
                      style: TextStyle(
                        fontSize: main_Height * 0.022,
                      ),
                      // onSaved: (newValue) {
                      //   firstName = newValue;
                      // },
                      // onChanged: (value){
                      //   firstName = value;
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First Name can\'t be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        // filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),

                        ),
                        // fillColor: ,
                        hintText: "Amount",
                        hintStyle:  TextStyle(
                            color: Colors.grey,
                            fontSize: main_Height * 0.018
                        ),
                        border: const OutlineInputBorder(
                          // borderSide:
                          // const BorderSide(color: Colors.white),
                          // borderRadius: BorderRadius.circular(10)

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),






                  ],
                ),
                )






              ],
            ),
          ),



    );
  }
}

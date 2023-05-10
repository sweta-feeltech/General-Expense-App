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


  String? _selectedOption;

  List<String> _options = ['Category 1', 'Category 2', 'Category 3', 'Category 3'];


  @override
  void initState() {
    super.initState();
    _selectedOption = _options[0]; // set initial value to the first option
  }


  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;



    return Scaffold(

      backgroundColor: primaryGrey,

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
                    Container(
                      width: main_Width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child:  DropdownButton<String>(
                        value: _selectedOption,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue!;
                          });
                        },
                        items: _options.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option,
                            selectionColor: Colors.black,
                            ),
                          );
                        }).toList(),
                      ),

                    )



                  ],
                ),
                )






              ],
            ),
          ),



    );
  }
}

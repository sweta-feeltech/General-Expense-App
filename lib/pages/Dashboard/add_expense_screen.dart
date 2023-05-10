import 'package:date_time_picker/date_time_picker.dart';
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

  List<String> _options = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4'
  ];

  @override
  void initState() {
    super.initState();
    _selectedOption = _options[0];
    // set initial value to the first option
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
      bottomSheet: Container(
        height: main_Height * 0.085,
        width: main_Width * 1,
        decoration: const BoxDecoration(color: primaryGrey),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: 10),
          child: Container(
            height: main_Height * 0.06,
            width: main_Width * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: primaryPurple,
              ),
              onPressed: () {},
              child: Text(
                "Add Expense",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: main_Height * 0.018,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: main_Width * 0.03,
                  vertical: main_Height * 0.01
                ),
                child: Column(
                  children: [


                    Row(
                      children: [
                        Text(
                          "Amount",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: main_Height * 0.018),
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
                        Text(
                          "Category",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: main_Width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        value: _selectedOption,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue!;
                          });
                        },
                        items: _options.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(
                              option,
                              selectionColor: Colors.black,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),


                    Row(
                      children: [
                        Text(
                          "Date Time",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DateTimePicker(
                      use24HourFormat: false,
                      type: DateTimePickerType.dateTimeSeparate,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        // filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        // fillColor: ,
                        hintText: "Date of Birth",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: main_Height * 0.018),
                        border: const OutlineInputBorder(
                            // borderSide:
                            //     const BorderSide(color: Colors.transparent),
                            // borderRadius: BorderRadius.circular(10)

                            ),
                      ),
                      dateMask: 'd MMM, yyyy',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),

                      icon: Icon(Icons.event),

                      // dateLabelText: 'Date',
                      // timeLabelText: "Hour",
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        if (date.weekday == 6 || date.weekday == 7) {
                          return false;
                        }

                        return true;
                      },
                      onChanged: (val) => print(val),
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(val),
                    ),
                    const SizedBox(
                      height: 15,
                    ),


                    Row(
                      children: [
                        Text(
                          "To Pay",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                        hintText: "To Pay",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: main_Height * 0.018),
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
      ),
    );
  }
}

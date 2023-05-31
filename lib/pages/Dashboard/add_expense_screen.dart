import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/models/CommonModel/message_model.dart';
import 'package:general_expense_app/models/CustomModel/expense_cat_filter_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/colors.dart';
import '../../Utils/document_upload.dart';
import '../../blocs/ExpenseScreen/expense_screen_bloc.dart';
import '../../models/Expense/add_expense_category_model.dart';
import '../../models/Expense/get_expense_category_model.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';

class AddExpenseScreen extends StatefulWidget {
  static String routeName = '/addExpenseScreen';
  Function backPressCallback;

  AddExpenseScreen(this.backPressCallback, {super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String? selectedOption;
  String? SelectedDropDownItem;

  PlatformFile? PIimage;

  String? Amount, CategoryExpense, DateTime1, ToPay, Remarks;

  @override
  void initState() {
    super.initState();

    loadAllCATListScreenApiCalls();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  List<dynamic>? allDocs = [];

  ExpenseScreenBloc expenseScreenBloc =
      ExpenseScreenBloc(Repository.getInstance());

  List<GetExpenseCatModel>? getExpenseCatModelData;

  AddExpenseCatModel? addExpenseCatModelData;
  MessageModel? messageModelData;

  loadAllCATListScreenApiCalls() {
    expenseScreenBloc.add(FetchAllExpenseCatScreenListScreenAPIsEvent());
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<ExpenseScreenBloc>(
        create: (context) =>
            expenseScreenBloc..add(ExpenseScreenListInitialEvent()),
        child: BlocConsumer<ExpenseScreenBloc, ExpenseScreenState>(
          builder: (context, state) {
            if (state is ExpenseScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllExpenseCatListScreenAPIsEventState) {
              getExpenseCatModelData = state.getExpenseCatModelData;

              return mainViewAllScreenViewWidget();
            } else if (state is PostAddExpenseCatEventState) {
              addExpenseCatModelData = state.addExpenseCatModelData;

              loadAllCATListScreenApiCalls();
              return mainViewAllScreenViewWidget();
            }

            else if (state is PostAddExpenseFormEventState) {
              messageModelData = state.messageModelData;
              PIimage = null;

              loadAllCATListScreenApiCalls();
              return mainViewAllScreenViewWidget();
            }

            else {
              return Container();
            }
          },
          listener: (context, state) {
            if (state is ApiFailureState) {
              ThemeHelper.customDialogForMessage(
                  context,
                  (state.exception.toString().replaceAll('Exception:', ''))
                      .replaceAll(':', ''),
                  MediaQuery.of(context).size.width, () {
                Navigator.of(context).pop();
                loadAllCATListScreenApiCalls();
              }, ForSuccess: false);
            }
          },
        ));
  }

  Widget mainViewAllScreenViewWidget() {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    List<ExpenseCatFilterModel> expenseCatListForFilter = [];

    getExpenseCatModelData!
        .map((e) =>
            expenseCatListForFilter.add(ExpenseCatFilterModel(e.id.toString(),e.expenseCategoryName.toString())))
        .toList();

    // for(int i=0; i < getExpenseCatModelData!.length; i++) {
    //
    //
    //   getExpenseCatModelData.map((e) => getExpenseCatModelData.
    //   // getExpenseCatModelData?.where((data) => data.expenseCategoryName).toList();
    //
    //   expenseCatListForFilter!.add(expenseCatListForFilter(getExpenseCatModelData![i].expenseCategoryName));
    //
    // }
    // List<String> expenseCat =  getExpenseCatModelData![];

    return Scaffold(
      // resizeToAvoidBottomInset:false,
      backgroundColor: primaryGrey,
      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "Add Expense",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        // centerTitle: true,
      ),
      bottomSheet: Container(
        height: main_Height * 0.13,
        width: main_Width * 1,
        decoration: BoxDecoration(color: Colors.transparent),
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: main_Height * 0.035),
        child: Container(
          height: main_Height * 0.06,
          width: main_Width * 0.8,
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
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();

                final testDate =
                    DateTime1 == DateTime.now().toString().substring(0, 16)
                        ? "${DateTime1?.replaceAll(" ", "T")}"
                        : "${DateTime1?.replaceAll(" ", "T")}:00";

                // print(
                //     "check Expense : ${Amount} ${testDate} ${selectedOption} ${ToPay} ${Remarks} ");
                //
                // print("ddddddd : ${selectedOption} ");

                PIimage == null ?
                    ThemeHelper.showToastMessage(
                      "Add File or Image"
                    )
                    :
                expenseScreenBloc.add(PostAddExpenseFormEvent("${selectedOption}","${testDate}","${Amount}","${ToPay}","${Remarks}",File(PIimage!.path.toString())));


              }
            },
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        // reverse: true,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: main_Width * 0.03,
                    vertical: main_Height * 0.01),
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
                      onSaved: (newValue1) {
                        Amount = newValue1;
                      },
                      // onChanged: (value){
                      //   firstName = value;
                      // },
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Amount can\'t be empty';
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              // width: main_Width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(3)),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child:  DropdownButtonFormField<dynamic>(
                                isExpanded: true,
                                value: selectedOption ?? SelectedDropDownItem,
                                style:  TextStyle(
                                    color: Colors.black
                                ),
                                validator: (value) {
                                  if(value == null) {
                                    return "Select Category First";
                                  }
                                  return null;
                                },

                                items: expenseCatListForFilter.map((ExpenseCatFilterModel value) {
                                  return DropdownMenuItem<String>(
                                    value: value.id.toString(),
                                    child: Text(
                                      value.expenseCategoryName.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:  TextStyle(
                                      ),
                                    ),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "Select Category"
                                ),

                                onChanged: (val) {
                                  setState(() {
                                    SelectedDropDownItem = val;
                                  });
                                  print("aaaa${SelectedDropDownItem} ");

                                },

                                onSaved: (val) {
                                  setState(() {
                                    selectedOption = val;
                                  });
                                },
                              )),
                        ),
                        SizedBox(
                          width: main_Width * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            _displayAddCatInputDialog(context);
                          },
                          child: Container(
                            height: main_Height * 0.05,
                            width: main_Height * 0.05,
                            child: SvgPicture.asset(
                              "assets/images/add.svg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
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
                      // use24HourFormat: false,
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
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        // if (date.weekday == 6 || date.weekday == 7) {
                        //   return false;
                        // }

                        return true;
                      },
                      // onChanged: (val){
                      //   IncomeDate = val;
                      // },
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) {
                        print("val ${val}");
                        print("val ${DateTime.now().toString()}");
                        print(
                            "ddn${DateTime.now().toString().substring(0, 19)}");
                        DateTime1 = val.toString().substring(0, 16) ==
                                DateTime.now().toString().substring(0, 16)
                            ? "${DateTime.now().toString().substring(0, 19)}"
                            : val;
                        print("val${DateTime1}");
                        // print("daaaate${IncomeDate}");
                        // print("daaaate${val}");
                      },
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
                      onSaved: (newValue2) {
                        ToPay = newValue2;
                      },
                      // onChanged: (value){
                      //   firstName = value;
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'To Pay can\'t be empty';
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
                    Row(
                      children: [
                        Text(
                          "Remarks",
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
                      height: main_Height * 0.2,
                      child: TextFormField(
                        // initialValue: "Remarks",
                        // initialValue: "${getProfileModelData?.description == null ? appUserData?.description == null ?  "" : appUserData?.description : getProfileModelData?.description}",
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        // textAlign: TextAlign.start,
                        maxLines: null,
                        // minLines: null,
                        style: TextStyle(
                          fontSize: main_Height * 0.022,
                        ),
                        onSaved: (newValue) {
                          Remarks = newValue;
                        },
                        // onChanged: (value){
                        //   description = value;
                        // },
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'First Name can\'t be empty';
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          hintText: "Remarks",
                          contentPadding:
                              EdgeInsets.only(top: 5, bottom: 5, left: 10),
                          // filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          // fillColor: ,

                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: main_Height * 0.018),
                          border: OutlineInputBorder(
                              // borderSide:
                              //     const BorderSide(color: Colors.transparent),
                              // borderRadius: BorderRadius.circular(10)
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Add File Or Images",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: main_Height * 0.1,
                      child: InkWell(
                        onTap: () async {
                          PlatformFile? aIamge =
                              await UploadDocumets.selectFile();

                          PIimage = aIamge;
                          print("sssssimage${PIimage}");
                          print("sssssimage${aIamge}");

                          setState(() {
                            PIimage = aIamge;
                            print("sssssimage${PIimage!.name}");
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: (PIimage != null)
                                ? cardOfDocAfterUploadSuccessWidget(PIimage!,
                                    cardTextWidth: 200)
                                : cardOfDocBeforeUploadWidget(
                                    PIimage?.identifier, context)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: main_Height * 0.4,
                width: main_Width * 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _displayAddCatInputDialog(BuildContext context) async {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: _formkey,
            child: AlertDialog(
              title: Text(
                'Add Expense Category',
                style: TextStyle(),
              ),
              content: Container(
                height: main_Height * 0.05,
                width: main_Width * 0.08,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                          onSaved: (onSavedVal) {
                            CategoryExpense = onSavedVal;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Category Name can\'t be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: "Enter Expense Category",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: darkGrey,
                                fontSize: main_Height * 0.018),
                          ),
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: main_Height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryPurple)))),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: primaryPurple,
                          fontSize: main_Height * 0.01872,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
                SizedBox(
                  width: main_Width * 0.2,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: primaryPurple))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryPurple)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          print("Catttt${CategoryExpense}");

                          expenseScreenBloc.add(
                              PostAddExpenseCatEvent("${CategoryExpense}"));
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Add",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: main_Height * 0.01872,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          );
        });
  }

  Widget cardOfDocBeforeUploadWidget(
      String? docToUpload, BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(main_Width * 0.015),
      decoration: BoxDecoration(border: Border.all(color: primaryPurple)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Click to upload",
                style: TextStyle(
                    color: primaryPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: main_Height * 0.018),
              ),
              Text("${docToUpload == null ? "" : docToUpload}",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      letterSpacing: 0.8,
                      fontSize: main_Height * 0.015)),
              Text("Upload .jpg or .pdf file",
                  style: TextStyle(
                      color: Colors.black, fontSize: main_Height * 0.012))
            ],
          ),
          Image(
            image: AssetImage("assets/images/add_doc.png"),
            width: 40,
          ),
        ],
      ),
    );
  }

  Widget cardOfDocAfterUploadSuccessWidget(PlatformFile uploadedFile,
      {double? cardTextWidth}) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: primaryPurple)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: cardTextWidth ?? null,
                child: RichText(
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text:
                          "${uploadedFile.name == "null" ? "" : uploadedFile.name}\n",
                      style: TextStyle(
                          color: primaryPurple, fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          uploadedFile.extension == "jpeg" ||
                  uploadedFile.extension == "png" ||
                  uploadedFile.extension == "jpg"
              ? Image(
                  image: AssetImage("assets/images/picture_pre.jpg"),
                  width: 40,
                )
              : Image(
                  image: AssetImage("assets/images/pdf_pre.png"),
                  width: 40,
                )
        ],
      ),
    );
  }
}

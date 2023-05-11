import 'dart:convert';
import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/colors.dart';
import '../../Utils/document_upload.dart';

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


  final amountController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _selectedOption = _options[0];
    // set initial value to the first option
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  /////
  /// HERE WE CREATE A INSTANCE OF IMAGE PICKER PACKAGE
  /////
  final _picker = ImagePicker();
  File? featureImage;
  final fundraiserInnerImageList = List<File>.filled(2, File(""));
  // List<dynamic>? fundraiserInnerImageList = [];
  File? fundraiserInnerImage1, fundraiserInnerImage2, fundraiserInnerImage3;

  Future getImage(int ind) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      if(ind == 0){
        featureImage = File(pickedFile.path);
      }
      // if(ind == 1 || ind == 2 || ind == 3) {
      if(ind == 1 || ind == 2 ) {
        for(int i = 0; i < 2; i++) {
          if(fundraiserInnerImageList.length < 3) {
            if(ind == 1){
              // fundraiserInnerImageList[0] = File(pickedFile.toString());
              fundraiserInnerImageList[0] = File(pickedFile.path);
            }
            if(ind == 2){
              // fundraiserInnerImageList[1] = File(pickedFile.toString());
              fundraiserInnerImageList[1] = File(pickedFile.path);
            }
            // if(ind == 3) {
            //   // fundraiserInnerImageList[2] = File(pickedFile.toString());
            //   fundraiserInnerImageList[2] = File(pickedFile.path);
            // }
          }
          break;
        }
        if(ind == 1) {
          fundraiserInnerImage1 = File(pickedFile.path);
        }
        if (ind == 2) {
          fundraiserInnerImage2 = File(pickedFile.path);
        }
        // if (ind == 3) {
        //   fundraiserInnerImage3 = File(pickedFile.path);
        // }
        print("fundraiserInnerImageList: $fundraiserInnerImageList");
      }
      setState(() {});
      print(featureImage);
    } else {
      print("No Image Selected");
    }
  }

  List<dynamic>? allDocs = [];




  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
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
                      keyboardType: TextInputType.number,
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
                      child: DropdownButtonHideUnderline(
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
                          underline: null,
                        ),
                      )
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


                    Row(
                      children: [
                        Text("Remarks",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
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
                        // onSaved: (newValue) {
                        //   description = newValue;
                        // },
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

                          hintStyle:  TextStyle(
                              color: Colors.grey,
                              fontSize: main_Height * 0.018
                          ),
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
                        Text("Add File Or Images",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.018,
                              fontWeight: FontWeight.w500),
                        )
                        
                      ],
                    ),
                    SizedBox(
                      height: main_Height * 0.1,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            var abc = 1;
                            PlatformFile? single;

                            allDocs?.forEach((value) {
                              // print("hello: ${value['name']}");
                              if (value['name'] == abc) {
                                single = value['file'];
                              }
                            });

                            return InkWell(
                              onTap: () async {
                                PlatformFile? a =
                                await UploadDocumets.selectFile();

                                setState(() {
                                  var b = {
                                    "name": abc,
                                    "file": a
                                  };
                                  allDocs = [...?allDocs, b];
                                  // docObject.addEntries({"${kycDocListModelData![index].id}" : "${a}"}.entries);
                                  // docObject = {
                                  //   ...docObject,
                                  //   "${kycDocListModelData![index].id}": "${a}"
                                  // };
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: (single != null)
                                      ? cardOfDocAfterUploadSuccessWidget(single!,
                                      context,
                                      cardTextWidth: 200)
                                      : cardOfDocBeforeUploadWidget(context)),
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              // selectProfilePic();
                              getImage(1);
                              print("hi");
                            },
                            // child: (userPic == null)
                            child: (fundraiserInnerImage1 == null)
                                ? Image(
                              image: AssetImage(
                                  "assets/images/upload_image_holder.png"),
                              width: main_Height * 0.2 ,
                              height: main_Height * 0.2,
                            )
                                : Stack(
                              alignment: Alignment.topRight,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Image.file(
                                    File(fundraiserInnerImage1!.path),
                                    // width: main_height < 700 ? 100 : 160,
                                    // height: main_height < 700 ? 100 : 140,

                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  right: -7,
                                  child: GestureDetector(
                                    onTap: () {
                                      fundraiserInnerImage1 = null;
                                      fundraiserInnerImageList[0] = File("");
                                      print("fundraiserInnerImageList after removing image: $fundraiserInnerImageList");
                                      print("first inner image");
                                      setState(() {});
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 211, 211, 211),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.clear, size: 18, color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),

                        Flexible(
                          child: InkWell(
                            onTap: () {
                              getImage(2);
                            },
                            child: (fundraiserInnerImage2 == null)
                                ? Image(
                              image: AssetImage(
                                  "assets/images/upload_image_holder.png"),
                              width: main_Height * 0.2,
                              height: main_Height * 0.2,
                            )
                                : Stack(
                              alignment: Alignment.topRight,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Image.file(
                                    File(fundraiserInnerImage2!.path),
                                    // width: main_height < 700 ? 200 : 160,
                                    // height: main_height < 700 ? 200 : 140,
                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  right: -7,
                                  child: GestureDetector(
                                    onTap: () {
                                      fundraiserInnerImage2 = null;
                                      fundraiserInnerImageList[1] = File("");
                                      print("fundraiserInnerImageList after removing image: $fundraiserInnerImageList");
                                      setState(() {});
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 211, 211, 211),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.clear, size: 18, color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(width: 10,),

                        // Flexible(
                        //   child: InkWell(
                        //     onTap: () {
                        //       // selectProfilePic();
                        //       getImage(3);
                        //       print("hi");
                        //     },
                        //     // child: (userPic == null)
                        //     child: (fundraiserInnerImage3 == null)
                        //         ? Image(
                        //       image: AssetImage(
                        //           "assets/images/upload_image_holder.png"),
                        //       width: main_Height * 0.2,
                        //       height: main_Height * 0.2,
                        //     )
                        //         : Stack(
                        //       alignment: Alignment.topRight,
                        //       clipBehavior: Clip.none,
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(vertical: 8),
                        //           child: Image.file(
                        //             File(fundraiserInnerImage3!.path),
                        //             // width: main_height < 700 ? 200 : 160,
                        //             // height: main_height < 700 ? 200 : 140,
                        //           ),
                        //         ),
                        //         Positioned(
                        //           top: -5,
                        //           // right: -2,
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               fundraiserInnerImage3 = null;
                        //               fundraiserInnerImageList[2] = File("");
                        //               print("fundraiserInnerImageList after removing image: $fundraiserInnerImageList");
                        //               setState(() {});
                        //             },
                        //             child: Container(
                        //                 padding: EdgeInsets.all(2),
                        //                 decoration: BoxDecoration(
                        //                   color: Color.fromARGB(255, 211, 211, 211),
                        //                   shape: BoxShape.circle,
                        //                 ),
                        //                 child: Icon(Icons.clear, size: 18, color: Colors.black,)
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),


                  ],
                ),
              ),

              Container(
                height: main_Height * 0.13,
                width: main_Width * 1,
              )

            ],
          ),
        ),
      ),
    );
  }



  Widget cardOfDocBeforeUploadWidget(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return Container(
      height: main_Height * 0.072,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black38,width:1),
      borderRadius: BorderRadius.circular(3)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Click to upload",
                style: TextStyle(color: primaryPurple, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                child: Text("Upload .jpg or .pdf file",
                    style: TextStyle(color: Colors.black, fontSize: 10)),
              )
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


  Widget cardOfDocAfterUploadSuccessWidget(PlatformFile uploadedFile,BuildContext context,{double? cardTextWidth}) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Container(
      height: main_Height * 0.072,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black38,width:1),
        borderRadius: BorderRadius.circular(3),
      ),
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
                      text: "${uploadedFile.name}\n",
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

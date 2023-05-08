import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/colors.dart';
import '../../Utils/constants.dart';


class EditProfileScreen extends StatefulWidget {
  static String routeName = 'profileScreen';
  Function backPressCallback;

  EditProfileScreen(this.backPressCallback,{super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  final _picker = ImagePicker();

  File? profilePic;


  Future getImage() async {

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if(pickedFile != null) {
      profilePic = File(pickedFile.path);
      setState(() {
      });
      print(profilePic);
    } else {
      print("No Image Selected");
    }
  }



  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Form(
      key: _formkey,
      child: RefreshIndicator(
        onRefresh: () async {
        },
        child: Scaffold(

          backgroundColor: primaryGrey,
          // resizeToAvoidBottomInset: false,
          appBar:AppBar(
            // centerTitle: false,
            titleSpacing: 0,
            backgroundColor: primaryPurple,
            // elevation: 0,
            leading:   IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minHeight: 20, minWidth: 20),
              onPressed: () {
                widget.backPressCallback.call();
                // Navigator.of(context).pop("refresh");
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            title:    Text("Edit Profile",
              style:
              TextStyle(color: Colors.white, fontSize: main_Height * 0.025),),

          ),

          bottomSheet: Container(
            height: main_Height * 0.085,
            width: main_Width * 1,
            decoration: BoxDecoration(color: Colors.white),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: primaryOrange,
                  ),
                  onPressed: () {

                  },
                  child: Text("Next",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: main_Height * 0.018,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),


          body: SafeArea(
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                children: [



                  Container(
                    decoration: BoxDecoration(
                        color: primaryPurple,
                        border: Border.all(
                            width: 0,
                            color: primaryPurple
                        )
                    ),
                    height: main_Height * 0.015,
                  ),

                  Container(
                    color: primaryPurple,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: primaryPurple
                              ),
                              height: main_Height * 0.07,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0,color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0)
                                  ),
                                  color: Colors.white
                              ),
                              height: main_Height * 0.07,
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: ClipOval(
                                    child: Material(
                                        child: Container(
                                          width: main_Height * 0.13,
                                          height: main_Height * 0.13,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7)
                                          ),
                                          child: Material(
                                              color: Colors.transparent,
                                              child:
                                              ProfilePicture != null ?
                                              profilePic == null ?
                                              Ink.image(
                                                image: NetworkImage("$ProfilePicture"),
                                                fit: BoxFit.cover,
                                                width: 120,
                                                height: 120,
                                                child: InkWell(
                                                  onTap: () {
                                                    getImage();
                                                  },
                                                ),
                                              ) :
                                              GestureDetector(
                                                onTap: () {
                                                  getImage();
                                                },
                                                child: Image.file(
                                                  File("${profilePic!.path}").absolute,
                                                  width: 120,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                                  : profilePic == null ?  Ink.image(
                                                image: NetworkImage(
                                                    "https://st2.depositphotos.com/1006318/5909/v/380/depositphotos_59095055-stock-illustration-profile-icon-male-avatar.jpg?forcejpeg=true"),
                                                fit: BoxFit.cover,
                                                width: 120,
                                                height: 120,
                                                child: InkWell(
                                                  onTap: () {
                                                    getImage();
                                                  },
                                                ),
                                              ) :
                                              GestureDetector(
                                                onTap: () {
                                                  getImage();
                                                },
                                                child: Image.file(
                                                  File("${profilePic!.path}").absolute,
                                                  width: 120,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                          ),
                                        )
                                    ),
                                  ),
                                ),


                              ],
                            )
                          ],)

                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: main_Width * 0.05,),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("User Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: main_Height * 0.017,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          initialValue: "${Username}",
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
                            enabledBorder: OutlineInputBorder(

                            ),
                            // fillColor: ,
                            hintText: "User Name",
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
                        const SizedBox(
                          height: 15,
                        ),


                        Row(
                          children: [
                            Text("Email Address",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: main_Height * 0.017,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          initialValue: "${Email}",
                          // initialValue: "${getProfileModelData?.email == null ? appUserData!.email : getProfileModelData!.email}",
                          style: TextStyle(
                            fontSize: main_Height * 0.022,
                          ),
                          // onSaved: (newValue) {
                          //   email = newValue;
                          // },
                          // onChanged: (value){
                          //   email = value;
                          // },
                          validator: (value) {
                            RegExp regex = RegExp(
                                "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (value == null || value.isEmpty) {
                              return 'Email can\'t be empty';
                            } else if (!regex.hasMatch(value)) {
                              return ("Please check your email address");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                            // filled: true,
                            enabledBorder: OutlineInputBorder(

                            ),
                            // fillColor: ,
                            hintText: "Email Address",
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
                        const SizedBox(
                          height: 15,
                        ),


                        Row(
                          children: [
                            Text("Mobile No.",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: main_Height * 0.017,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          // initialValue: "${Email}",
                          // initialValue: "${getProfileModelData?.email == null ? appUserData!.email : getProfileModelData!.email}",
                          style: TextStyle(
                            fontSize: main_Height * 0.022,
                          ),
                          // onSaved: (newValue) {
                          //   email = newValue;
                          // },
                          // onChanged: (value){
                          //   email = value;
                          // },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mobile Number can\'t be empty';
                            } else if (value.length != 10) {
                              return 'Mobile Number should have atleast 10 digits';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                            // filled: true,
                            enabledBorder: OutlineInputBorder(

                            ),
                            // fillColor: ,
                            hintText: "Mobile No",
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
                        const SizedBox(
                          height: 15,
                        ),


                        Row(
                          children: [
                            Text("Date of Birth",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: main_Height * 0.017,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        DateTimePicker(
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                            // filled: true,
                            enabledBorder: OutlineInputBorder(

                            ),
                            // fillColor: ,
                            hintText: "Date of Birth",
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
                          type: DateTimePickerType.date,
                          dateMask: 'dd MMM, yyyy',
                          // initialValue: "${getProfileModelData?.dob == null ? appUserData?.dob == null ? DateTime.now().toString() : appUserData?.dob : getProfileModelData?.dob}",
                          // initialValue: "${appUserData!.dob}" == null ? DateTime.now().toString() : "${appUserData!.dob}",
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          // icon: Icon(Icons.event),
                          // dateLabelText: 'Date',
                          // timeLabelText: "Hour",
                          onChanged: (val) => print(val),
                          // validator: (val) {
                          //   print(val);
                          //   return null;
                          // },
                          // onSaved: (val) {
                          //   dob = val;
                          //
                          // },
                        ),
                        const SizedBox(
                          height: 15,
                        ),


                      ],
                    ),
                  ),

                  SizedBox(
                    height: main_Height * 0.085,
                    width: main_Width * 1,
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

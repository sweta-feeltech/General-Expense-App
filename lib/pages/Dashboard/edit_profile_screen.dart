import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../Utils/api_end_points.dart';
import '../../Utils/colors.dart';
import '../../Utils/constants.dart';
import '../../blocs/EditProfileScreen/edit_profile_screen_bloc.dart';
import '../../models/ProfileModel/edit_profile_model.dart';
import '../../network/api_client.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';


class EditProfileScreen extends StatefulWidget {
  static String routeName = '/editProfileScreen';
  Function backPressCallback;

  EditProfileScreen(this.backPressCallback,{super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {



  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  EditProfileModel? editeprofiledata;

  UserData1? getProfileModelData;


  EditProfilePageBloc editProBloc = EditProfilePageBloc(Repository.getInstance());



  String? firstName, lastName, birthDate;
  File? profilePic;

  final _picker = ImagePicker();


  @override
  void initState() {
    index2 = 0;
    super.initState();
    // editProBloc.add(PutProfileDataEvent(id,firstName,lastName,email,dob,description,profilePic: profilePic ));
  }


  var index2;


  Repository repositoryRepo = Repository(ApiClient(httpClient: http.Client()));

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

    return Scaffold(

      body: BlocProvider<EditProfilePageBloc>(
        create: (context) => editProBloc..add(EditProfilePageInitialEvent()),
        child: BlocConsumer<EditProfilePageBloc, EditProfilePageState>(
          builder: (context, state) {
            if (state is EditProfilePageLoadingState) {
              print("Loading State");
              return ThemeHelper.buildLoadingWidget();
            }
            // else
            // if (state is AllFetchDataForProfilePageState) {
            //   getProfileModelData = state.allProfileModelresponse;
            //   return mainAllEditProfileView();
            // }
            else
            if(state is EditPutProfileDataState){

              print("Put State State1");
              print("${state.editProfileModelResponse.message}");
              print("Put State State2");
              getProfileModelData = state.editProfileModelResponse.userData;
              print("Put State State3");
              // appUserData?.firstName = getProfileModelData?.firstName;
              // appUserData?.lastName = getProfileModelData?.lastName;
              // appUserData?.email = getProfileModelData?.email;
              // appUserData?.dob = getProfileModelData?.dob;
              // appUserData?.profilePic = getProfileModelData?.profilePic;
              print("Put State State4");



              // editProBloc.add(AllFetchDataForProfilePageEvent());

              // TextSpan contentMes = TextSpan(
              //     text: "Profile Data Updated",style: TextStyle(color: Colors.grey, fontSize: 15));



              // ThemeHelper.customDialogForMessage(
              //     isBarrierDismissible: false,
              //     context,
              //     "Edit Done",
              //     main_Width,
              //     contentMessage: contentMes,
              //         () {
              //       // Navigator.of(context).pop();
              //       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen((){})));
              //       // Navigator.of(context).pop('refresh');
              //     },
              //     ForSuccess: true);


              return mainAllEditProfileView();
            }
            else {
              return mainAllEditProfileView();
            }
          },
          listener: (context, state) {
            if (state is ApiFailureState) {
              print(state.exception.toString());
            }
            // else
            // if(state is EditPutProfileDataState){
            //   print("${state.editProfileModelResponse.message}");
            //
            //   editProBloc.add(AllFetchDataForProfilePageEvent());
            //
            //   TextSpan contentMes = TextSpan(
            //       text: "Profile Data changed",style: TextStyle(color: Colors.grey, fontSize: 15));
            //   ThemeHelper.customDialogForMessage(
            //       isBarrierDismissible: false,
            //       context,
            //       "Edit Done",
            //       main_Width,
            //       contentMessage: contentMes,
            //           () {
            //         Navigator.of(context).pop();
            //         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen((){})));
            //         // Navigator.of(context).pop('refresh');
            //       },
            //       ForSuccess: true);
            //
            // }
          },
        ),
      ),
    );




  }

  Widget mainAllEditProfileView(){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return WillPopScope(

      onWillPop: () async {
        Navigator.of(context).pop("refresh");
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ProfileScreen(
        //
        //     "${getProfileModelData?.firstName}",
        //
        //     "${getProfileModelData?.lastName}",
        //     "${getProfileModelData?.description}",
        //     "${getProfileModelData?.profilePic}",
        //         (){
        //       print("getdata : ${getProfileModelData?.firstName}");
        //
        //     })), (route) => false);
        return true;
      },
      child: Form(
        key: _formkey,
        child: RefreshIndicator(
          onRefresh: () async {
          },
          child: Scaffold(

            backgroundColor: Colors.white,
            // resizeToAvoidBottomInset: false,
            appBar:AppBar(
              // centerTitle: false,
              titleSpacing: 0,
              backgroundColor: primaryPurple,
              elevation: 0,
              leading:   IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
                onPressed: () {
                  // Navigator.of(context).pop();
                  // widget.backPressCallback.call();
                  Navigator.of(context).pop("refresh");
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              title:    Text("Edit Profile ${appUserData?.userName}",
                style:
                TextStyle(color: Colors.white, fontSize: main_Height * 0.022),),

            ),


            bottomSheet: Container(
              height: main_Height * 0.085,
              width: main_Width * 1,
              decoration: const BoxDecoration(color: Colors.white),
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
                    onPressed: () {


                      if(_formkey.currentState!.validate()){

                        _formkey.currentState!.save();
                        editProBloc.add(PutProfileDataEvent(firstName,lastName,birthDate,profilePic: profilePic));


                        TextSpan contentMes = TextSpan(
                            text: "Profile Data Updated",style: TextStyle(color: Colors.grey, fontSize: 15));

                        ThemeHelper.customDialogForMessage(
                            isBarrierDismissible: false,
                            context,
                            "Profile Updated Successfully",
                            main_Width,
                            // contentMessage: contentMes,
                                () {
                              Navigator.of(context).pop();
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen((){})));
                              // Navigator.of(context).pop('refresh');
                            },
                            ForSuccess: true);

                      }



                    },
                    child: Text("Update",
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
                                decoration: const BoxDecoration(
                                    color: primaryPurple
                                ),
                                height: main_Height * 0.07,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0,color: Colors.white),
                                    borderRadius: const BorderRadius.only(
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
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
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
                                                child: appUserData?.profilePic != null ?
                                                profilePic == null ?
                                                Ink.image(
                                                  image: NetworkImage("$BASEIMAGEURL${getProfileModelData?.profilePic}"),
                                                  fit: BoxFit.cover,
                                                  width: main_Height * 0.13,
                                                  height: main_Height * 0.13,
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
                                                    width: main_Height * 0.13,
                                                    height: main_Height * 0.13,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                                    : profilePic == null ?  Ink.image(
                                                  image: AssetImage("assets/images/avtar.png"),
                                                  onImageError: (exception, stackTrace) => AssetImage("assets/images/avtar.png"),
                                                  fit: BoxFit.cover,
                                                  width: main_Height * 0.13,
                                                  height: main_Height * 0.13,
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
                                                    width: main_Height * 0.13,
                                                    height: main_Height * 0.13,
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
                              Text("First Name",
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
                            // initialValue: "${getProfileModelData?.firstName == null ? appUserData!.firstName : getProfileModelData!.firstName}",
                            style: TextStyle(
                              fontSize: main_Height * 0.022,
                            ),
                            onSaved: (newValue) {
                              firstName = newValue;
                            },
                            onChanged: (value){
                              firstName = value;
                            },
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
                              hintText: "First Name",
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
                              Text("Last Name",
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
                            // initialValue: "${getProfileModelData?.lastName == null ? appUserData!.lastName : getProfileModelData!.lastName}",
                            style: TextStyle(
                              fontSize: main_Height * 0.022,
                            ),
                            onSaved: (newValue) {
                              lastName = newValue;
                            },
                            onChanged: (value){
                              lastName = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Last Name can\'t be empty';
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
                              hintText: "Last Name",
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
                                    fontSize: main_Height * 0.018,
                                    fontWeight: FontWeight.w500
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
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),

                              ),
                              // fillColor: ,
                              hintText: "Date of Birth",
                              hintStyle:  TextStyle(
                                  color: Colors.grey,
                                  fontSize: main_Height * 0.018
                              ),
                              border: const OutlineInputBorder(
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
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) {
                              birthDate = val;

                            },
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
      ),
    );

  }


}

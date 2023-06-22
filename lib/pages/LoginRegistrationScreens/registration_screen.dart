import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/api_end_points.dart';
import '../../Utils/colors.dart';
import '../../Utils/constants.dart';
import '../../blocs/Registration/registration_screen_bloc.dart';
import '../../models/CommonModel/user_data_model.dart';
import '../../models/LoginRegisterModel/login_model.dart';
import '../../models/ProfileModel/get_profile_model.dart';
import '../../network/repository.dart';
import '../Dashboard/bottom_nav_bar.dart';
import '../Widgets/theme_helper.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/registrationScreen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? firstName, lastName, email, password, confirmPassword;

  bool visiblePassowrd = true;
  bool conVisiblePassowrd = true;

  final toast = FToast();

  RegistrationScreenBloc registrationScreenBloc = RegistrationScreenBloc(Repository.getInstance());


  LoginModel? loginResponseData;


  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<RegistrationScreenBloc>(
      create: (context) => registrationScreenBloc..add(RegistrationScreenInitialEvent()),
      child: BlocConsumer<RegistrationScreenBloc,RegistrationScreenState>(
        builder: (context, state) {
          if (state is RegistrationScreenLoadingState) {
            return ThemeHelper.buildLoadingWidget();
          } else {
            return mainRegistrationScreen();
          }
        },
        listener: (context, state) async {
          if (state is APIFailureState) {
            ThemeHelper.toastForAPIFaliure(state.exception.toString());
          } else if (state is PostRegistrationDataEventState) {

            final prefs = await SharedPreferences.getInstance();

            loginResponseData = state.loginResponseData;

            print("logindd ${loginResponseData!.accessToken}");

            accessToken = state.loginResponseData.accessToken;
            print("acs${accessToken}");

            appUserData = state.loginResponseData.userData;

            print("aappuu${appUserData}");

            var user_data = jsonDecode(json.encode(loginResponseData?.userData));

            userDataForSession = json.encode(UserData.fromJson(user_data));

            await prefs.setString("accessSession", state.loginResponseData.accessToken!);


            await prefs.setString("userSessionData", userDataForSession!);

            // we are calling here Api of User Profile page so we can match email to redirect user to the category page.
            var userProfileData = await fetchProfileData();


            /// 1 = "APPROVED"
            if(userProfileData!.email != null){
              print("cate");

              await prefs.setString("accessSession", state.loginResponseData.accessToken!);
              print("get sess: ${prefs.getString("accessSession")}");


              // await prefs.setBool('IsAppUser', IsAppUser!);
              print("appUserData signup: ${appUserData}");


              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBarScreen()));


              Fluttertoast.showToast(
                msg: "Successfully Logged In...",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );

              accessToken = state.loginResponseData.accessToken;
            }

            else {
              print("profile");
            }

          }
        },
      ),
    );



  }



  Widget mainRegistrationScreen (){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomSheet: Container(
        height: main_Height * 0.1,
        width: main_Width,
        child: Center(
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: main_Height * 0.060,
              width: main_Width * 0.9,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  side: BorderSide(style: BorderStyle.none),
                  backgroundColor: primaryPurple,
                ),
                onPressed: () {
                  if (validateAndSave()) {

                    print(
                        " details $firstName, $lastName, $email, $password, $confirmPassword");
                    registrationScreenBloc.add(PostRegistrationDataEvent("${firstName}","${lastName}","${email}","${confirmPassword}"));
                  }

                },
                child: Text(
                  "Create an Account",
                  style: TextStyle(
                      fontSize: main_Height * 0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),




      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: main_Width * 0.09,),

          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign Up",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: main_Height * 0.028,
                                    fontWeight: FontWeight.w500,
                                    color: primaryOrange),
                              ),
                              Text(
                                " to start again",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: main_Height * 0.028,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "authentic information",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: main_Height * 0.028,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "By click the create account button, you agree \nto Terms and Service and acknlowledge \nthe Privacy and Policy of the company",
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: main_Height * 0.0155,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                    child: Container(
                      width: main_Width,
                      decoration: const BoxDecoration(
                        // color: Color.fromARGB(255, 240, 240, 240),
                        color: Colors.transparent,
                        // borderRadius: BorderRadius.circular(10)
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                                onSaved: (onSavedVal) {
                                  firstName = onSavedVal;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name can\'t be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  hintText: "First Name",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: darkGrey,
                                      fontSize: main_Height * 0.020),
                                  prefixIcon: SizedBox(
                                      width: 5,
                                      height: 5,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.person,
                                          size: main_Height * 0.03,
                                          color: primaryPurple,
                                        ),
                                        onPressed: null,
                                        alignment: Alignment.bottomLeft,
                                      )),
                                  contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 0),
                                  enabledBorder:
                                  ThemeHelper.signupMyInputBorder(),
                                  focusedBorder:
                                  ThemeHelper.signupMyFocusedBorder(),
                                ),
                                textInputAction: TextInputAction.next),

                            SizedBox(
                              height: main_Height * 0.016,
                            ),
                            TextFormField(
                                onSaved: (onSavedVal) {
                                  lastName = onSavedVal;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name can\'t be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,

                                  hintText: "Last Name",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: darkGrey,
                                      fontSize: main_Height * 0.020),
                                  prefixIcon: SizedBox(
                                      width: 5,
                                      height: 5,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.person,
                                          size: main_Height * 0.03,
                                          color: primaryPurple,
                                        ),
                                        onPressed: null,
                                        alignment: Alignment.bottomLeft,
                                      )),
                                  contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 0),
                                  enabledBorder:
                                  ThemeHelper.signupMyInputBorder(),
                                  focusedBorder:
                                  ThemeHelper.signupMyFocusedBorder(),


                                  errorStyle:
                                  TextStyle(color: Colors.redAccent),
                                ),
                                textInputAction: TextInputAction.next),
                            SizedBox(
                              height: main_Height * 0.016,
                            ),
                            ThemeHelper.mainMobileTextFormField(
                                main_Height * 0.020,
                                "Email",
                                    (onSavedVal) {
                                  email = onSavedVal;
                                },
                                Icons.mail,
                                TextInputAction.next,
                                validatingFunc: (value) {
                                  RegExp regex = RegExp(EmailRegex);
                                  if (value == null || value.isEmpty) {
                                    return 'Email can\'t be empty';
                                  } else if (!regex.hasMatch(value)) {
                                    return ("Please check your email address");
                                  }
                                  return null;
                                },
                                context: context
                            ),
                            SizedBox(
                              height: main_Height * 0.016,
                            ),
                            TextFormField(
                                obscureText: visiblePassowrd,
                                onSaved: (onSavedVal) {
                                  password = onSavedVal;
                                },
                                onChanged: (value) {
                                  password = value;
                                },
                                validator: (value) {
                                  RegExp regex = RegExp(PassWordRegex);
                                  if (value == null || value.isEmpty) {
                                    return 'Password can\'t be empty';
                                  } else if (!regex.hasMatch(value)) {
                                    return ("Password Doesn't match rquirements.");
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: darkGrey,
                                      fontSize: main_Height * 0.020),
                                  prefixIcon: SizedBox(
                                      width: 5,
                                      height: 5,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.key_outlined,
                                          size: main_Height * 0.03,
                                          color: primaryPurple,
                                        ),
                                        onPressed: null,
                                        alignment: Alignment.bottomLeft,
                                      )),
                                  suffixIcon: SizedBox(
                                    height: 5,
                                    width: 5,
                                    child: IconButton(
                                      icon: Icon(
                                        visiblePassowrd
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: primaryPurple,
                                        size: main_Height * 0.03,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visiblePassowrd = !visiblePassowrd;
                                        });
                                      },
                                      alignment: Alignment.bottomRight,
                                    ),
                                  ),
                                  contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 0),
                                  enabledBorder: ThemeHelper.signupMyInputBorder(),
                                  focusedBorder:
                                  ThemeHelper.signupMyFocusedBorder(),
                                  errorStyle: TextStyle(color: Colors.redAccent),
                                ),
                                textInputAction: TextInputAction.next),
                            SizedBox(
                              height: main_Height * 0.016,
                            ),
                            TextFormField(
                                obscureText: conVisiblePassowrd,
                                onSaved: (onSavedVal) {
                                  confirmPassword = onSavedVal;
                                },
                                onChanged: (value) {
                                  confirmPassword = value;
                                },
                                validator: (value) {
                                  print(password);
                                  if (value == null || value.isEmpty) {
                                    return ('Confirm Password can\'t be empty');
                                  } else if (value.length < 8) {
                                    return ("minimum character should be 8");
                                  } else if (value != password) {
                                    return ("Password and Confirm Password doesn't match");
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: darkGrey,
                                      fontSize: main_Height * 0.020),
                                  prefixIcon: SizedBox(
                                      width: 5,
                                      height: 5,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.key_outlined,
                                          size: main_Height * 0.03,
                                          color: primaryPurple,
                                        ),
                                        onPressed: null,
                                        alignment: Alignment.bottomLeft,
                                      )),
                                  suffixIcon: SizedBox(
                                    height: 5,
                                    width: 5,
                                    child: IconButton(
                                      icon: Icon(
                                        conVisiblePassowrd
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: primaryPurple,
                                        size: main_Height * 0.03,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          conVisiblePassowrd = !conVisiblePassowrd;
                                        });
                                      },
                                      alignment: Alignment.bottomRight,
                                    ),
                                  ),
                                  contentPadding:
                                  EdgeInsets.only(top: 18, bottom: 0),
                                  enabledBorder: ThemeHelper.signupMyInputBorder(),
                                  focusedBorder:
                                  ThemeHelper.signupMyFocusedBorder(),
                                  // errorBorder: ThemeHelper.enableerrorBorder(),
                                  // focusedErrorBorder: ThemeHelper.enablefocuserrorBorder(),
                                  errorStyle: TextStyle(color: Colors.redAccent),
                                ),
                                textInputAction: TextInputAction.done),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: main_Width * 0.01,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Password must be at least 8 character, uppercase, \nlowercase, and unique code like #%!",
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: main_Height * 0.0140,
                                        color: Colors.black45,
                                      )),
                                ],
                              ),
                            ),




                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: main_Height * 0.1,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );


  }



  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<GetProfileModel?> fetchProfileData() async {


    final response = await http.get(
        Uri.parse("${BASEURL}${getProfileApiEnd}"),
        headers: {
          "isClient": "true",
          "Authorization": "Bearer $accessToken"
        });

    if (response.statusCode == 200) {
      final r_body = json.decode(response.body);
      return GetProfileModel.fromJson(r_body);
    } else {
      throw Exception("Unable to fetch data!");
    }
  }


}

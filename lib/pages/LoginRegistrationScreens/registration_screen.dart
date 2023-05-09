import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/main_screen.dart';

import '../../Utils/constants.dart';
import '../Dashboard/bottom_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomSheet: Container(
        height: main_Height * 0.1,
        width: main_Width,
        child: Center(
          child: SizedBox(
            height: main_Height * 0.060,
            width: main_Width * 0.9,
            child: OutlinedButton(
              child: Text(
                "Create Account",
                style: TextStyle(
                    fontSize: main_Height * 0.02,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                side: BorderSide(style: BorderStyle.none),
                backgroundColor: primaryOrange,
              ),
              onPressed: () {
                if (validateAndSave()) {

                  print(
                      " details $firstName, $lastName, $email, $password, $confirmPassword");
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomBarScreen()));

                }

              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: main_Width * 0.03, vertical: main_Height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign Up",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: main_Height * 0.026,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamedAndRemoveUntil(MainPageScreen.routeName, (route) => false);
                          },
                          child: Text(
                            "Cancle",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: main_Height * 0.018,
                                fontWeight: FontWeight.w600,
                                color: primaryOrange),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: main_Height * 0.02,
                    ),
                    Text(
                        "Please create an account or log in to access more aunthethic information, Lorem Ipsum is simply dummy text of the.",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: main_Height * 0.020,
                          color: Colors.grey,
                        )),
                  ],
                ),
                SizedBox(
                  height: main_Height * 0.04,
                ),


                Container(
                  width: main_Width,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 240, 240, 240),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: TextFormField(
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
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: TextFormField(
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
                                    // errorBorder: ThemeHelper.enableerrorBorder(),
                                    // focusedErrorBorder: ThemeHelper.enablefocuserrorBorder(),
                                    errorStyle:
                                        TextStyle(color: Colors.redAccent),
                                  ),
                                  textInputAction: TextInputAction.next),
                            ),
                          ],
                        ),
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
                              // errorBorder: ThemeHelper.enableerrorBorder(),
                              // focusedErrorBorder: ThemeHelper.enablefocuserrorBorder(),
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
                        SizedBox(
                          height: main_Height * 0.032,
                        )
                      ],
                    ),
                  ),
                ),



                SizedBox(
                  height: main_Height * 0.1,
                )
              ],
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


}

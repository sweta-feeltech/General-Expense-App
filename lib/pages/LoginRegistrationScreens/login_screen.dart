import 'package:flutter/material.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/registration_screen.dart';

import '../../Utils/colors.dart';
import '../../Utils/constants.dart';
import '../Widgets/theme_helper.dart';

class LogInScreen extends StatefulWidget {
  static String routeName = '/loginScreen';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool visiblePassowrd = true;

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return mainLoginForm();


  }



  Widget mainLoginForm(){
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
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (validateAndSave()) {

                    // print(
                    // " details $firstName, $lastName, $email, $password, $confirmPassword");
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomBarScreen()));

                  }

                },
                child: Text(
                  "LogIn",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: main_Width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign In",
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
                      padding: EdgeInsets.symmetric(
                        horizontal: main_Width * 0.03,
                      ),
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
                padding: EdgeInsets.symmetric(
                  horizontal: main_Width * 0.03,
                ),
                child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: main_Height * 0.0155,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: main_Height * 0.02,
              ),
              Center(
                child: Container(
                  width: main_Width * 0.75,
                  height: main_Height * 0.30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/cover.png",),
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              SizedBox(
                height: main_Height * 0.02,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03,),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        ThemeHelper.mainMobileTextFormField(
                            main_Height * 0.020,
                            "Email",
                                (onSavedVal) {
                              email = onSavedVal;
                            },
                            Icons.mail,
                            TextInputAction.next,
                            initalTxt: "admin@gmail.com",
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
                            initialValue: "Admin@123",
                            validator: (value) {
                              RegExp regex = RegExp(PassWordRegex);
                              if (value == null || value.isEmpty) {
                                return 'Password can\'t be empty';
                              } else
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

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: main_Height * 0.0165,
                                  color: Colors.black,),
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                onPressed: () => {
                                  Navigator.pushNamed(
                                      context, RegistrationScreen.routeName)
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontSize: main_Height * 0.0165,
                                    color: primaryPurple,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    )),
              ),
            ],
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

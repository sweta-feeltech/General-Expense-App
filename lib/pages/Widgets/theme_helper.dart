
import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/colors.dart';

class ThemeHelper {

  static UnderlineInputBorder myInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.grey,
            // color: Color.fromARGB(70, 78, 78, 78),
            width: 1.5
        )
    );
  }

  static UnderlineInputBorder signupMyInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
          // color: darkGrey,
            color: Color.fromARGB(70, 78, 78, 78),
            width: 1.5
        )
    );
  }

  static UnderlineInputBorder myFocusedBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black,
            width: 2
        )
    );
  }

  static UnderlineInputBorder signupMyFocusedBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: primaryPurple,
            width: 2
        )
    );
  }

  static UnderlineInputBorder myDisabledFieldBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
          // color: darkGrey,
            color: Color.fromARGB(70, 78, 78, 78),
            width: 1
        )
    );
  }

  static Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static void addRoomDialogBox(
    {
      required BuildContext context, 
      required VoidCallback logoutPress, 
      required double heightData,
      required String popupTitle,
      required String popupcontent, 
    }
  ) {
    showDialog(
      context: context, 
      builder: (context) {
        double main_Width = MediaQuery.of(context).size.width;
        double main_Height = MediaQuery.of(context).size.height;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Color.fromARGB(255, 217, 231, 250),
                    color: Colors.white,
                  ),
                  height: main_Height * 0.22,
                  width: main_Width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popupTitle,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        // SizedBox(height: main_Height * 0.0235,),
                        // Image(image: AssetImage("assets/images/logout_reverse.png"), width: 30, height: 30,),

                        TextFormField(
                            onSaved: (onSavedVal) {
                              // firstName = onSavedVal;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First Name can\'t be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              hintText: "Enter a room name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: darkGrey,
                                  fontSize: main_Height * 0.018),
                              // prefixIcon: SizedBox(
                              //     width: 5,
                              //     height: 5,
                              //     child: IconButton(
                              //       icon: Icon(
                              //         Icons.person,
                              //         size: main_Height * 0.03,
                              //         color: primaryPurple,
                              //       ),
                              //       onPressed: null,
                              //       alignment: Alignment.bottomLeft,
                              //     )
                              //   ),
                              contentPadding:
                              EdgeInsets.only(top: 18, bottom: 0),
                              enabledBorder:
                              ThemeHelper.signupMyInputBorder(),
                              constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                              focusedBorder:
                              ThemeHelper.signupMyFocusedBorder(),
                            ),
                            textInputAction: TextInputAction.next
                          ),

                        // Text(popupcontent,
                        // textAlign: TextAlign.center, 
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: main_Height * 0.021
                        //   ),
                        // ),
                        SizedBox(height: main_Height * 0.0235,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: main_Width * 0.2,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                }, 
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                ),
                                child: Text("Cancel", style: TextStyle(color: darkGrey, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                              ),
                            ),
                            SizedBox(width: 10,),
              
                            SizedBox(
                                width: main_Width * 0.2,
                              child: TextButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                  backgroundColor: MaterialStateProperty.all(primaryPurple)
                                ),
                                onPressed: logoutPress,
                                child: Text("Add",
                                    overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: main_Height * 0.01872,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ),
                            ),
                          ],
                        ),
              
                      ],
                    ),
                  ),
                ),
              ),

              // Positioned(
              //   top: -60,
              //   child: Material(
              //     borderRadius: BorderRadius.circular(60),
              //     elevation: 10,
              //     child: CircleAvatar(
              //       // backgroundColor: Color.fromARGB(255, 230, 241, 255),
              //       backgroundColor: Colors.white,
              //       radius: 60,
              //       child: Image.asset("assets/images/app_icon_png.png", width: 80, height: 80,)
              //     ),
              //   )
              // )
            ],
          ),
        );
      }
    );
  }


  static void addGroupDialogBox(
      {
        required BuildContext context,
        required VoidCallback logoutPress,
        required double heightData,
        required String popupTitle,
        required String popupcontent,
      }
      ) {
    showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Color.fromARGB(255, 217, 231, 250),
                      color: Colors.white,
                    ),
                    height: main_Height * 0.22,
                    width: main_Width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popupTitle,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 5,),
                          // SizedBox(height: main_Height * 0.0235,),
                          // Image(image: AssetImage("assets/images/logout_reverse.png"), width: 30, height: 30,),

                          TextFormField(
                              onSaved: (onSavedVal) {
                                // firstName = onSavedVal;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First Name can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                hintText: "Enter a Group name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: darkGrey,
                                    fontSize: main_Height * 0.018),
                                // prefixIcon: SizedBox(
                                //     width: 5,
                                //     height: 5,
                                //     child: IconButton(
                                //       icon: Icon(
                                //         Icons.person,
                                //         size: main_Height * 0.03,
                                //         color: primaryPurple,
                                //       ),
                                //       onPressed: null,
                                //       alignment: Alignment.bottomLeft,
                                //     )
                                //   ),
                                contentPadding:
                                EdgeInsets.only(top: 18, bottom: 0),
                                enabledBorder:
                                ThemeHelper.signupMyInputBorder(),
                                constraints: BoxConstraints(minHeight: 28, maxHeight: 30),
                                focusedBorder:
                                ThemeHelper.signupMyFocusedBorder(),
                              ),
                              textInputAction: TextInputAction.next
                          ),

                          // Text(popupcontent,
                          // textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: main_Height * 0.021
                          //   ),
                          // ),
                          SizedBox(height: main_Height * 0.0235,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: main_Width * 0.2,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                    ),
                                    child: Text("Cancel", style: TextStyle(color: darkGrey, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                                ),
                              ),
                              SizedBox(width: 10,),

                              SizedBox(
                                width: main_Width * 0.2,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                        backgroundColor: MaterialStateProperty.all(primaryPurple)
                                    ),
                                    onPressed: logoutPress,
                                    child: Text("Add",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: main_Height * 0.01872,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                // Positioned(
                //   top: -60,
                //   child: Material(
                //     borderRadius: BorderRadius.circular(60),
                //     elevation: 10,
                //     child: CircleAvatar(
                //       // backgroundColor: Color.fromARGB(255, 230, 241, 255),
                //       backgroundColor: Colors.white,
                //       radius: 60,
                //       child: Image.asset("assets/images/app_icon_png.png", width: 80, height: 80,)
                //     ),
                //   )
                // )
              ],
            ),
          );
        }
    );
  }





  static Widget mainMobileTextFormField(
      double fieldHeight,
      String hintTxt,
      final void Function(String? val)? onSaveFunc,
      IconData preFixIcon,
      TextInputAction isNextOrDone, {
        final String? Function(String? val)? validatingFunc,
        String? initalTxt,
        bool? isObsecure,
        final void Function(String? val)? onChangeFunc,
        IconData? sufFixIcon,
        final void Function()? onSufIconPress,
        final int? maxCharLength,
        final TextInputType? keyboardType,
        final bool? isReadOnly,
        final bool? isEnabled,
        required BuildContext context
      }) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return TextFormField(
        keyboardType: keyboardType,
        readOnly: isReadOnly ?? false,
        enabled: isEnabled ?? true,
        initialValue: initalTxt ?? null,
        maxLength: maxCharLength ?? null,
        style: TextStyle(
          fontSize: fieldHeight,
        ),
        obscureText: isObsecure ?? false,
        onSaved: onSaveFunc,
        onChanged: onChangeFunc,
        validator: validatingFunc,
        decoration: InputDecoration(
          counterText: "",
          floatingLabelBehavior: FloatingLabelBehavior.never,

          hintText: hintTxt,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: darkGrey,
          ),

          prefixIcon: SizedBox(
              width: 5,
              height: 5,
              child: IconButton(
                icon: Icon(
                  preFixIcon,
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
                sufFixIcon,
                color: primaryPurple,
                size: main_Height * 0.03,
              ),
              onPressed: onSufIconPress,
              alignment: Alignment.bottomRight,
            ),
          ),
          contentPadding: EdgeInsets.only(top: 18, bottom: 0),
          enabledBorder: ThemeHelper.signupMyInputBorder(),
          focusedBorder: ThemeHelper.signupMyFocusedBorder(),
          disabledBorder: ThemeHelper.myDisabledFieldBorder(),
          errorStyle: TextStyle(color: Colors.redAccent),
        ),
        textInputAction: isNextOrDone);
  }


}

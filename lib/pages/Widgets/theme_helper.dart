
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

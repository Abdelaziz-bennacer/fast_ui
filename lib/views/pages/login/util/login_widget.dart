import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/login/util/login_constants.dart';
import 'package:fast_ui/views/pages/login/util/login_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class LoginWidget {
  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //login background image layout
  Widget loginBackGroundImage(String image, context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }

  //White body Container Layout
  Widget bodyContainer({Widget? child, BuildContext? context, color}) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context!).size.height /
              (Platform.isIOS ? 9.2 : AppScreenUtil().size(7.2))),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().size(15),
          vertical: AppScreenUtil().size(25)),
      width: MediaQuery.of(context).size.width,
      height: AppScreenUtil().screenActualHeight(),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppScreenUtil().borderRadius(22)),
              topRight: Radius.circular(AppScreenUtil().borderRadius(22)))),
      child: child,
    );
  }

  //textformfield layout
  Widget textFieldLayout({
    String? text,
    fillcolor,
    borderColor,
    hintColor,
    TextEditingController? controller,
    Widget? suffixIcon,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onFieldSubmitted,
    FocusNode? focusNode,
    bool isLargeScreen = false,
    bool obscureText = true,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(14),
            horizontal: AppScreenUtil().size(20)),
        suffixIcon: suffixIcon,
        fillColor: fillcolor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        hintText: text,
        hintStyle: TextStyle(
            fontSize: 15,
            color: hintColor,
            fontFamily: GoogleFonts.mulish().fontFamily),
      ),
    );
  }

  //sign in button
  Widget signInButton({
    color,
    BuildContext? context,
    fontColor,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: AppScreenUtil().size(10)),
        width: MediaQuery.of(context!).size.width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: LoginFontStyle().mulishtextLayout(
            text: LoginFont().signIn,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );
  }

  //fogot password widget
  Widget forgotPasswordWidget({color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LoginFontStyle().mulishtextLayout(
            text: LoginFont().forgotPassword,
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        const Space(0, 15),
      ],
    );
  }

  //create new user layout
  Widget createUserWidget({
    color,
    fontWeight,
    GestureTapCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginFontStyle().mulishtextLayout(
            color: color,
            text: LoginFont().creatUser,
            fontWeight: fontWeight,
            fontSize: 14,
            onTap: onTap),
        const Space(1.5, 0),
        LoginFontStyle().mulishtextLayout(
            color: color,
            text: LoginFont().createNow,
            fontWeight: fontWeight,
            fontSize: 14,
            textDecoration: TextDecoration.underline,
            onTap: onTap),
      ],
    );
  }

  //login with layout
  Widget loginWithLayout({color, fontColor, fontWeight}) {
    return Row(
      children: [
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 5,
            dashColor: color,
            lineThickness: 2,
            dashRadius: 2,
          ),
        ),
        const Space(10, 0),
        LoginFontStyle().mulishtextLayout(
          color: fontColor,
          text: LoginFont().signInWith,
          fontWeight: fontWeight,
          fontSize: textSizeSMedium,
        ),
        const Space(10, 0),
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            dashLength: 5,
            dashColor: color,
            lineThickness: 2,
            dashRadius: 2,
          ),
        )
      ],
    );
  }

//contiune as guest
  Widget continueAsGuest({color}) {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 10.0 : 0),
      child: LoginFontStyle()
          .mulishtextLayout(
              text: LoginFont().continueAsGuest,
              color: color,
              fontSize: textSizeSMedium,
              textDecoration: TextDecoration.underline)
          .marginOnly(bottom: 10),
    );
  }
}

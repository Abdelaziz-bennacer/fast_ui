import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/offers/util/offer_constants.dart';
import 'package:fast_ui/views/pages/offers/util/offer_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class OfferWidget {
  //textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: AppScreenUtil().screenWidth(20)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: fillcolor,
          filled: true,
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
          hintText: text,
          hintStyle: TextStyle(
              fontSize: AppScreenUtil().fontSize(15),
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //pop layout
  Widget popLayout({Widget? child, var categoryTextColor, context}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
        ),
        height: MediaQuery.of(context).size.height / 2.2,
        child: child);
  }

  //common button widget
  Widget commonButtonWidget(
      {context,
      var containerColor,
      var borderColor,
      var textColor,
      String? text}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenWidth(13),
          horizontal: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
        border: Border.all(
            color: borderColor, width: .5), //border of dropdown button
      ),
      child: OfferFontStyle().mulishtextLayout(
          text: text,
          textAlign: TextAlign.center,
          fontSize: OfferFontSize.textSizeSmall,
          color: textColor),
    );
  }

  //popup detail layout
  Widget bottomSheetLayout({Widget? child, var primaryColor}) {
    return Container(
      height: AppScreenUtil().screenHeight(150),
      padding: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(25),
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(20)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      child: child,
    );
  }

  //code display layout
  Widget codeLayout({Widget? child, var lightPrimary}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: lightPrimary,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: child,
    );
  }

  //copy Code style
  Widget copyCodeButton({text, var whiteColor, var primaryColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(12),
          vertical: AppScreenUtil().screenHeight(6)),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(50))),
      child: OfferFontStyle().mulishtextLayout(
          text: text,
          color: primaryColor,
          fontSize: OfferFontSize.textSizeSMedium,
          fontWeight: FontWeight.bold),
    );
  }
}

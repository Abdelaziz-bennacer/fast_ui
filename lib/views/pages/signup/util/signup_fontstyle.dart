import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/signup/util/signup_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupFontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: fontWeight,
            fontFamily: GoogleFonts.nunitoSans().fontFamily));
  }

//mulish font family text layout
  Widget mulishtextLayout({
    String? text,
    color,
    double fontSize = textSizeMedium,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration textDecoration = TextDecoration.none,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          style: AppCss().mulishTextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: textSizeMedium,
              textDecoration: textDecoration)),
    );
  }
}

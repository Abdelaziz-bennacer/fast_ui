import 'package:flutter/material.dart';
import '../../../../common/app_screen_util.dart';
import '../../../../common/theme/app_css.dart';
import '../../category/util/category_constants.dart';

class Error404FontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: AppCss().nunitoTextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: AppScreenUtil().fontSize(fontSize)));
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
              fontSize: AppScreenUtil().fontSize(fontSize),
              textDecoration: textDecoration)),
    );
  }

  //quicksand font family text layout
  Widget quicksandtextLayout(
      {String? text,
      color,
      double fontSize = textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: AppCss().quicksandTextStyle(
          color: color,
          fontSize: AppScreenUtil().fontSize(fontSize),
          fontWeight: fontWeight),
    );
  }
}

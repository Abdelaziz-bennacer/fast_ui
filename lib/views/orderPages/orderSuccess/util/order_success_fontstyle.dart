import 'package:flutter/material.dart';

import '../../../../common/app_screen_util.dart';
import '../../../../common/theme/app_css.dart';
import 'order_success_constants.dart';

class OrderSuccessFontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = OrderSuccessFontSize.textSizeMedium,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(text!,
        style: AppCss().nunitoTextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: AppScreenUtil().fontSize(fontSize)));
  }

//mulish font family text layout
  Widget mulishtextLayout(
      {String? text,
      color,
      double fontSize = OrderSuccessFontSize.textSizeMedium,
      double height = 1,
      FontWeight fontWeight = FontWeight.normal,
      TextDecoration textDecoration = TextDecoration.none,
      GestureTapCallback? onTap,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.left}) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          overflow: overflow,
          textAlign: textAlign,
          style: AppCss().mulishTextStyle(
              color: color,
              fontWeight: fontWeight,
              height: height,
              fontSize: AppScreenUtil().fontSize(fontSize),
              textDecoration: textDecoration)),
    );
  }

  //quicksand font family text layout
  Widget quicksandtextLayout(
      {String? text,
      color,
      double fontSize = OrderSuccessFontSize.textSizeMedium,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.left}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: AppCss().quicksandTextStyle(
        color: color,
        fontSize: AppScreenUtil().fontSize(fontSize),
        fontWeight: fontWeight,
      ),
    );
  }
}

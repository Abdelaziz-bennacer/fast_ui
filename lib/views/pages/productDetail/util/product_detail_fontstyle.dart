import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';
import 'package:fast_ui/views/pages/productDetail/util/product_detail_constants.dart';

class ProductDetailFontStyle {
//nunito font family text layout
  Widget nunitotextLayout(
      {String? text,
      color,
      double fontSize = ProductDetailFontSize.textSizeMedium,
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
      double fontSize = ProductDetailFontSize.textSizeMedium,
      FontWeight fontWeight = FontWeight.normal,
      TextDecoration textDecoration = TextDecoration.none,
      GestureTapCallback? onTap,
      TextOverflow overflow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.left,
      double height = 1}) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          overflow: overflow,
          textAlign: textAlign,
          style: AppCss().mulishTextStyle(
              color: color,
              height: height,
              fontWeight: fontWeight,
              fontSize: AppScreenUtil().fontSize(fontSize),
              textDecoration: textDecoration)),
    );
  }

  //quicksand font family text layout
  Widget quicksandtextLayout(
      {String? text,
      color,
      double fontSize = ProductDetailFontSize.textSizeMedium,
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

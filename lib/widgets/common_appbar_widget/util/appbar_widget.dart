import 'package:flutter/material.dart';
import 'appbar_fontstyle.dart';

class AppBarWidget {
  //common icon image layout
  Widget commonIconImage(
      {String? image, double? height, GestureTapCallback? onTap, var color}) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(
          image!,
          height: height,
          color: color,
        ));
  }

  //back to home widget
  Widget backToHomeWidget(
      {String? text,
      color,
      GestureTapCallback? onTap,
      fontColor,
      BuildContext? context}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context!).size.width / 2.5,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: AppBarFontStyle().mulishtextLayout(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );
  }
}

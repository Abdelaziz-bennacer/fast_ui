import 'package:flutter/material.dart';
import '../../../../config.dart';
import 'error_404_constants.dart';
import 'error_404_fontstyle.dart';

class Error404Widget {
  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                bottom: AppScreenUtil().screenHeight(4)),
            child: Image.asset(
              iconAssets.category,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? image, var textColor, bool? isTheme}) {
    return Image.asset(
      image!,
      width: AppScreenUtil().screenWidth(100),
    );
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(15),
          top: AppScreenUtil().screenHeight(13),
          right: AppScreenUtil().screenWidth(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Error404Widget().commonIconImage(
              image: iconAssets.location, height: 16, color: iconColor),
          const Space(5, 0),
          Error404FontStyle().mulishtextLayout(
              text: Error404Font().name,
              fontSize: 14,
              fontWeight: FontWeight.normal),
          const Space(5, 0),
          Error404Widget().commonIconImage(image: iconAssets.user, height: 30),
        ],
      ),
    );
  }

  //common icon image layout
  Widget commonIconImage({String? image, double? height, var color}) {
    return Image.asset(
      image!,
      height: AppScreenUtil().screenHeight(height!),
      color: color,
    );
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
        width: MediaQuery.of(context!).size.width /
            AppScreenUtil().screenWidth(2.5),
        alignment: Alignment.center,
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(12)),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: Error404FontStyle().mulishtextLayout(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: fontColor),
      ),
    );
  }
}

import 'package:fast_ui/common/app_screen_util.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget {
  BottomNavigationBarItem bottomNavigationCard(
      {color,
      String? text,
      String? imageIcon,
      double height = 20,
      double width = 20,
      imagecolor}) {
    return BottomNavigationBarItem(
      backgroundColor: color,
      icon: Padding(
        padding: EdgeInsets.only(
            bottom: AppScreenUtil().screenHeight(text == 'Offers' ? 3 : 5),
            top: AppScreenUtil().screenHeight(5),
            right: AppScreenUtil().screenWidth(10),
            left: AppScreenUtil().screenWidth(10)),
        child: Image.asset(
          imageIcon!,
          height: AppScreenUtil().screenHeight(height),
          width: AppScreenUtil().screenWidth(width),
          color: imagecolor,
        ),
      ),
      label: text,
    );
  }
}

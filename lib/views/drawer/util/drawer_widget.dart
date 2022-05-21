import 'package:flutter/material.dart';
import '../../../common/app_screen_util.dart';
import '../../../extensions/spacing.dart';
import '../../../utilities/responsive_layout.dart';
import '../../pages/dashboard/theme_switcher.dart';
import 'drawer_constants.dart';
import 'drawer_fontstyle.dart';

class DrawerWidget {
  //user image layout
  Widget userImageLayout(
      {double? borderRaius, var image, double? imageHeight}) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(AppScreenUtil().borderRadius(borderRaius!)),
      child: Image.asset(
        image,
        height: AppScreenUtil().screenHeight(imageHeight!),
        fit: BoxFit.fill,
      ),
    );
  }

  //pop layout
  Widget popLayout({Widget? child, var context}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
        child: child);
  }

  //username and email layout
  Widget userNameAndEmailLayout(
      {String? userName,
      String? userEmail,
      var userNameFontColor,
      var emailFontColor,
      double? nameFontSize,
      double? emailFontSize}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerFontStyle().mulishtextLayout(
          text: userName,
          fontSize: nameFontSize!,
          fontWeight: FontWeight.w700,
          color: userNameFontColor,
        ),
        DrawerFontStyle().mulishtextLayout(
          text: userEmail,
          fontSize: emailFontSize!,
          color: emailFontColor,
        ),
      ],
    );
  }

  // divider line layout
  Widget dividerLineLayout(
      {double? height, double? horizontalPadding, var color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(horizontalPadding!)),
      child: Divider(
        height: AppScreenUtil().screenHeight(height!),
        color: color,
        thickness: 1,
      ),
    );
  }

  //common Image Layout
  Widget commonImageLayout({String? image, double? height, var iconColor}) {
    return image == 'assets/icons/language.png'
        ? Image.asset(image!, height: AppScreenUtil().screenHeight(height!))
        : Image.asset(
            image!,
            height: AppScreenUtil().screenHeight(height!),
            color: iconColor,
          );
  }

  //forward arrow icon container
  Widget forwardArrow({var color, context}) {
    return Container(
        padding: EdgeInsets.all(AppScreenUtil().screenWidth(5)),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(50))),
        child: Icon(Icons.arrow_forward_ios_outlined,
            size: AppScreenUtil()
                .size(ResponsiveWidget.isLargeScreen(context) ? 12 : 10)));
  }

  //common drawer listtile
  Widget commonDrawerListTile(
      {String? image,
      String? title,
      GestureTapCallback? onTap,
      var activeIconColor,
      var inActiveIconColor,
      var color,
      var iconColor,
      var toggleColor,
      var activeColor,
      var inactiveColor,
      double? height,
      double? fontSize,
      context,
      var selectedColor,
      var textColor,
      bool? status2,
      ValueChanged<bool>? onToggle}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8.0)),
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(10),
              horizontal: AppScreenUtil().screenWidth(10)),
          decoration: BoxDecoration(
              color: selectedColor,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  commonImageLayout(
                      image: image, height: height, iconColor: iconColor),
                  const Space(20, 0),
                  DrawerFontStyle().mulishtextLayout(
                      text: title, fontSize: fontSize!, color: textColor),
                ],
              ),
              (title == "Theme")
                  ? ThemeSwitcher(
                      inActiveIconColor: inActiveIconColor,
                      inactiveColor: inactiveColor,
                      activeColor: activeColor,
                      activeIconColor: activeIconColor,
                      onToggle: onToggle,
                      toggleColor: toggleColor,
                      status2: status2,
                      iconColor: iconColor,
                    )
                  : forwardArrow(color: color, context: context)
            ],
          )),
    );
  }

  //contact support text layout
  Widget contactSupport({String? title, double? fontSize, var color}) {
    return DrawerFontStyle().mulishtextLayout(
        text: DrawerFont().contactSupport,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: color);
  }

  //contact us button Layout
  Widget contactUsButtonLayout(
      {GestureTapCallback? onTap,
      var buttonColor,
      var textColor,
      String? text}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: AppScreenUtil().screenWidth(150),
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: DrawerFontStyle().mulishtextLayout(
            color: textColor,
            text: text,
            fontSize: 10,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

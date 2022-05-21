import 'package:fast_ui/config.dart';
import 'package:fast_ui/utilities/responsive_layout.dart';
import 'package:fast_ui/views/pages/dashboard/theme_switcher.dart';
import 'package:fast_ui/views/pages/yourAccount/util/your_ccount_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class YourAccountWidget {
  //appbar leading layout
  Widget appBarLeadingLayput({
    GestureTapCallback? onTap,
    Color? borderColor,
    Color? iconColor,
  }) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor!, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.arrow_back_sharp,
              size: AppScreenUtil().size(14),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, Color? textColor}) {
    return YourAccountFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

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

  //logout button
  Widget logoutButton(
      {String? text,
      Color? boxColor,
      Color? textColor,
      GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppScreenUtil().screenWidth(120),
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(15),
            top: AppScreenUtil().screenHeight(10)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(10),
            vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            color: boxColor),
        child: Row(
          children: [
            Image.asset(
              iconAssets.logout1,
              height: AppScreenUtil().screenHeight(30),
            ),
            const Space(10, 0),
            YourAccountFontStyle()
                .mulishtextLayout(text: text, fontSize: 14, color: textColor),
          ],
        ),
      ),
    );
  }

  //username and email layout
  Widget userNameAndEmailLayout(
      {String? userName,
      String? userEmail,
      Color? userNameFontColor,
      Color? emailFontColor,
      double? nameFontSize,
      double? emailFontSize}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YourAccountFontStyle().mulishtextLayout(
          text: userName,
          fontSize: nameFontSize!,
          fontWeight: FontWeight.w700,
          color: userNameFontColor,
        ),
        YourAccountFontStyle().mulishtextLayout(
          text: userEmail,
          fontSize: emailFontSize!,
          color: emailFontColor,
        ),
      ],
    );
  }

  //appbar action layout
  Widget appBarActionLayout({Color? iconColor, GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.drawerHome,
          color: iconColor,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //user account
  Widget userDetail({
    context,
    String? image,
    double? borderRaius,
    double? imageHeight,
    String? userName,
    String? userEmail,
    Color? userNameFontColor,
    Color? emailFontColor,
    Color? color,
    double? nameFontSize,
    double? emailFontSize,
  }) {
    return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(10),
                vertical: AppScreenUtil().screenHeight(15)),
            decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(10))),
            /*color: Colors.black26,*/
            child: Row(
              children: [
                //user Image layout
                YourAccountWidget().userImageLayout(
                    borderRaius: 50,
                    image: imageAssets.usersquare,
                    imageHeight: 50),
                const Space(10, 0),

                //user name and email layout
                YourAccountWidget().userNameAndEmailLayout(
                    userName: userName,
                    userEmail: userEmail,
                    userNameFontColor: userNameFontColor,
                    emailFontColor: emailFontColor,
                    nameFontSize: nameFontSize,
                    emailFontSize: emailFontSize),
              ],
            ))
        .marginOnly(
            left: AppScreenUtil().screenWidth(10),
            right: AppScreenUtil().screenWidth(10));
  }

  // divider line layout
  Widget dividerLineLayout(
      {double? height, double? horizontalPadding, Color? color}) {
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
  Widget commonImageLayout({String? image, double? height, Color? iconColor}) {
    return image == 'assets/icons/language.png'
        ? Image.asset(image!, height: AppScreenUtil().screenHeight(height!))
        : Image.asset(
            image!,
            height: AppScreenUtil().screenHeight(height!),
            color: iconColor,
          );
  }

  //forward arrow icon container
  Widget forwardArrow({Color? color, context}) {
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
      Color? activeIconColor,
      Color? inActiveIconColor,
      Color? color,
      Color? iconColor,
      Color? toggleColor,
      Color? activeColor,
      Color? inactiveColor,
      double? height,
      double? fontSize,
      context,
      Color? selectedColor,
      Color? textColor,
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
                  YourAccountFontStyle().mulishtextLayout(
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

  //common appbar
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap,
      Color? bgColor,
      Color? titleColor,
      String? text}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: YourAccountWidget().appBarLeadingLayput(
        onTap: () => Get.back(),
        borderColor: titleColor,
        iconColor: titleColor,
      ),
      title: YourAccountWidget()
          .appBarTitleLayout(text: text, textColor: titleColor),
      actions: [
        YourAccountWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}

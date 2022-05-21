import 'package:flutter/material.dart';
import '../../../common/app_screen_util.dart';
import '../../../common/assets/index.dart';
import '../../../config.dart';
import '../../../extensions/spacing.dart';
import 'drawer_widget.dart';

class DrawerCustomHeader extends StatelessWidget {
  final String? image;
  final double? borderRaius;
  final double? imageHeight;
  final String? userName;
  final String? userEmail;
  final Color? userNameFontColor;
  final Color? emailFontColor;
  final double? nameFontSize;
  final double? emailFontSize;

  const DrawerCustomHeader(
      {Key? key,
      this.userEmail,
      this.userName,
      this.emailFontSize,
      this.nameFontSize,
      this.emailFontColor,
      this.userNameFontColor,
      this.imageHeight,
      this.image,
      this.borderRaius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /*color: Colors.black26,*/
      child: Row(
        children: [
          //user Image layout
          DrawerWidget().userImageLayout(
              borderRaius: 50, image: imageAssets.usersquare, imageHeight: 50),
          const Space(10, 0),

          //user name and email layout
          DrawerWidget().userNameAndEmailLayout(
              userName: userName,
              userEmail: userEmail,
              userNameFontColor: userNameFontColor,
              emailFontColor: emailFontColor,
              nameFontSize: nameFontSize,
              emailFontSize: emailFontSize),
        ],
      ).paddingOnly(
          top: MediaQuery.of(context).size.height /
              AppScreenUtil().screenHeight(14),
          left: AppScreenUtil().screenWidth(30),
          right: AppScreenUtil().screenWidth(25)),
    );
  }
}

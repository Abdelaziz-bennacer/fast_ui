import 'package:flutter/material.dart';
import '../../../../common/app_screen_util.dart';
import '../../../../common/assets/index.dart';
import 'aboutus_constants.dart';
import 'aboutus_fontstyle.dart';

//Widget Layout
class AboutUsWidget {
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
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
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
  Widget appBarTitleLayout({String? text, var textColor}) {
    return AboutUsFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor, GestureTapCallback? onTap}) {
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

  //common title
  Widget commonTitle({String? text, var color}) {
    return //who we are text layout
        AboutUsFontStyle().mulishtextLayout(
            text: text,
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: AboutUsFontSize.textSizeSMedium);
  }

  //common image layout
  Widget commonImage({String? image}) {
    return Image.asset(
      image!,
      height: AppScreenUtil().screenHeight(20),
    );
  }
}

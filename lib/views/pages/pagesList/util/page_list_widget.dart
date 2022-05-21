import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/pagesList/util/page_list_constants.dart';
import 'package:fast_ui/views/pages/pagesList/util/page_list_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class PageListWidget {
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
    return PageListFontStyle().mulishtextLayout(
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

  //description layout
  Widget descriptionLayout({context, var boxColor, var titleColor}) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(10),
          horizontal: AppScreenUtil().screenWidth(15)),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(6))),
      child: PageListFontStyle().mulishtextLayout(
          height: 1.5,
          text:
              "Checkout all pages and their varations over here. following are the list of all the pages.",
          overflow: TextOverflow.clip,
          color: titleColor,
          fontWeight: FontWeight.w600,
          fontSize: PageListFontSize.textSizeSmall),
    );
  }
}

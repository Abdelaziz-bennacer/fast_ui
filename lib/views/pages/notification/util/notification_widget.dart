import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/notification/util/notification_constants.dart';
import 'package:fast_ui/views/pages/notification/util/notification_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class NotificationWidget {
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
    return NotificationFontStyle().mulishtextLayout(
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

  //category layout
  Widget categoryLayout({Widget? child, context, var color}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color,
      margin: EdgeInsets.only(
        bottom: AppScreenUtil().screenHeight(15),
      ),
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(8),
        left: AppScreenUtil().screenWidth(15),
        right: AppScreenUtil().screenWidth(15),
      ),
      height: AppScreenUtil().screenHeight(38),
      child: child,
    );
  }

  //Tabar layout
  Widget tabBarLayout(
      {var primary,
      var titleColor,
      TabController? controller,
      var tab1,
      var tab2}) {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.zero,
      labelPadding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
      isScrollable: true,
      indicatorColor: primary,
      unselectedLabelStyle: TextStyle(color: titleColor),
      unselectedLabelColor: titleColor,
      labelColor: primary,
      controller: controller,
      tabs: [
        Tab(
          text: tab1,
        ),
        Tab(
          text: tab2,
        ),
      ],
    );
  }

  //title layout
  Widget titleLayout({String? text, var color}) {
    return NotificationFontStyle().mulishtextLayout(
        text: text,
        fontSize: NotificationFontSize.textSizeSMedium,
        color: color);
  }

  //icon layout
  Widget iconLayout({var color, String? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(18),
          vertical: AppScreenUtil().screenHeight(14)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        icon!,
        height: AppScreenUtil().screenHeight(20),
      ),
    );
  }

  //common appbar
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap, var bgColor, var titleColor, var text}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: NotificationWidget().appBarLeadingLayput(
        onTap: () => Get.back(),
        borderColor: titleColor,
        iconColor: titleColor,
      ),
      title: NotificationWidget()
          .appBarTitleLayout(text: text, textColor: titleColor),
      actions: [
        NotificationWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}

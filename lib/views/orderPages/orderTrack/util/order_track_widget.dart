import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/orderPages/orderTrack/util/order_track_constants.dart';
import 'package:fast_ui/views/orderPages/orderTrack/util/order_track_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class OrderTrackWidget {
  //appbar leading layout
  Widget appBarLeadingLayput({
    GestureTapCallback? onTap,
    var borderColor,
    var iconColor,
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
  Widget appBarTitleLayout({String? image, var textColor, bool? isTheme}) {
    return Image.asset(
      image!,
      width: AppScreenUtil().screenWidth(100),
    );
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor, GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
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

  //orderDetail button layout
  Widget orderDetailButtonLayout(
      {context, var buttonColor, var itemColor, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppScreenUtil().screenHeight(45),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(20),
            vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: OrderTrackFontStyle().mulishtextLayout(
            text: OrderTrackFont().orderDetail,
            color: itemColor,
            fontSize: OrderTrackFontSize.textSizeMedium),
      ),
    );
  }

  //background layout
  Widget backgroundLayout({context}) {
    return Image.asset(
      imageAssets.mapSection,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.7,
      fit: BoxFit.fill,
    );
  }

  //content background layout
  Widget contentBGLayout({var color, Widget? child, context}) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.2),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
      child: child,
    );
  }

  //user widget layout
  Widget userLayout({String? image, var titleColor, var darkContentColor}) {
    return Row(
      children: [
        Image.asset(
          image!,
          height: AppScreenUtil().screenHeight(50),
        ),
        const Space(10, 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderTrackFontStyle().mulishtextLayout(
                text: "Andrea Joanne",
                fontSize: OrderTrackFontSize.textSizeSMedium,
                color: titleColor),
            OrderTrackFontStyle().mulishtextLayout(
                text: OrderTrackFont().courier,
                fontSize: OrderTrackFontSize.textSizeSMedium,
                color: darkContentColor),
          ],
        )
      ],
    );
  }

  //common layout for call and chat
  Widget commonLayoutForIcon({String? image, var boxColor, var borderColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        image!,
        height: AppScreenUtil().screenHeight(16),
      ),
    );
  }

  //address layout
  Widget addressLayout({
    var titleColor,
    var containerColor,
    var decColor,
  }) {
    return Row(
      children: [
        OrderTrackWidget().commonLayoutForIcon(
            image: iconAssets.home,
            boxColor: containerColor,
            borderColor: containerColor),
        const Space(10, 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderTrackFontStyle().mulishtextLayout(
                text: "8857 Morris Rd. ,Charlottesville, VA 22901",
                fontWeight: FontWeight.w700,
                fontSize: OrderTrackFontSize.textSizeSmall,
                color: titleColor),
            OrderTrackFontStyle().mulishtextLayout(
                text: "Store Location",
                fontWeight: FontWeight.normal,
                fontSize: OrderTrackFontSize.textXSizeSmall,
                color: decColor),
          ],
        ),
      ],
    );
  }

  // vertical line divider layout
  Widget verticalLineDivider() {
    return Padding(
      padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(20)),
      child: Image.asset(
        iconAssets.line,
        height: AppScreenUtil().screenHeight(30),
      ),
    );
  }

  //app bar layout
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap, var bgColor, var titleColor, String? image}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderTrackWidget().appBarLeadingLayput(
        onTap: () => Get.back(),
        borderColor: titleColor,
        iconColor: titleColor,
      ),
      title: OrderTrackWidget()
          .appBarTitleLayout(image: image, textColor: titleColor),
      actions: [
        OrderTrackWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}

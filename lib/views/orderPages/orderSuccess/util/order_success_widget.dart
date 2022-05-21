import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/orderPages/orderSuccess/util/order_success_constants.dart';
import 'package:fast_ui/views/orderPages/orderSuccess/util/order_success_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class OrderSuccesWidget {
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

  //trackPackage button layout
  Widget trackPackageButtonLayout(
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
        child: OrderSuccessFontStyle().mulishtextLayout(
            text: OrderSuccessFont().orderTrack,
            color: itemColor,
            fontSize: OrderSuccessFontSize.textSizeMedium),
      ),
    );
  }

  //order date and order id common layout
  Widget commonLayout(
      {var containerColor,
      var titleColor,
      var darkContentColor,
      String? image,
      String? title,
      String? val}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(10),
              vertical: AppScreenUtil().screenHeight(8)),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: Image.asset(
            image!,
            height: AppScreenUtil().screenHeight(18),
            fit: BoxFit.contain,
          ),
        ),
        const Space(10, 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSuccessFontStyle().mulishtextLayout(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: OrderSuccessFontSize.textSizeSmall,
                color: titleColor),
            const Space(0, 2),
            OrderSuccessFontStyle().mulishtextLayout(
                text: val,
                fontWeight: FontWeight.normal,
                fontSize: OrderSuccessFontSize.textSizeSmall,
                color: darkContentColor),
          ],
        ),
      ],
    );
  }

  //price detail layout
  Widget priceDetailLayout({var boxColor, Widget? child}) {
    return Container(
        height: AppScreenUtil().screenHeight(
            AppScreenUtil().screenActualWidth() > 377 ? 180 : 200),
        margin: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(15),
            bottom: AppScreenUtil().screenHeight(50)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(15),
            horizontal: AppScreenUtil().screenWidth(15)),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: child);
  }

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return OrderSuccessFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: OrderSuccessFontSize.textSizeSmall,
        fontWeight: fontWeight);
  }

  //common price detail layout
  Widget commonPriceDetail(
      {String? title,
      String? val,
      var titleColor,
      var valColor,
      var fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderSuccesWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        OrderSuccesWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

  //app bar layout
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap,
      var bgColor,
      var titleColor,
      String? image,
      GestureTapCallback? actionTap}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderSuccesWidget().appBarLeadingLayput(
        onTap: onTap,
        borderColor: titleColor,
        iconColor: titleColor,
      ),
      title: OrderSuccesWidget()
          .appBarTitleLayout(image: image, textColor: titleColor),
      actions: [
        OrderSuccesWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: actionTap),
      ],
    );
  }
}

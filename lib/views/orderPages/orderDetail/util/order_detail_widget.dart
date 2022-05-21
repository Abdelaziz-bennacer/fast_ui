import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/orderPages/orderDetail/util/order_detail_constants.dart';
import 'package:fast_ui/views/orderPages/orderDetail/util/order_detail_fontstyle.dart';
import 'package:flutter/material.dart';

//Widget Layout
class OrderDetailWidget {
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
    return OrderDetailFontStyle().mulishtextLayout(
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
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
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

  //reorder button layout
  Widget reorderButtonLayout(
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
        child: OrderDetailFontStyle().mulishtextLayout(
            text: OrderDetailFont().reorder,
            color: itemColor,
            fontSize: OrderDetailFontSize.textSizeMedium),
      ),
    );
  }

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return OrderDetailFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: OrderDetailFontSize.textSizeSmall,
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
        OrderDetailWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        OrderDetailWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

  //order id and status layout
  Widget orderIdAndStatus({var color, String? orderId, var textColor}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(10))),
      child: Row(
        children: [
          Image.asset(
            iconAssets.box,
            height: AppScreenUtil().screenHeight(30),
          ),
          const Space(10, 0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailFontStyle().mulishtextLayout(
                  text: orderId,
                  fontSize: OrderDetailFontSize.textSizeSmall,
                  color: textColor),
              const Space(0, 5),
              OrderDetailFontStyle().mulishtextLayout(
                  text: OrderDetailFont().orderDelivery,
                  letterSpacing: .5,
                  fontSize: OrderDetailFontSize.textSizeMedium,
                  fontWeight: FontWeight.w700,
                  color: textColor),
            ],
          ),
        ],
      ),
    );
  }

  //price detail layout
  Widget priceDetailLayout({Widget? child}) {
    return Container(
      margin: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(20),
          bottom: AppScreenUtil().screenHeight(20)),
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: child,
    );
  }

  //common title text layout
  Widget commonTitleText({String? title, var color}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: OrderDetailFontStyle().mulishtextLayout(
          text: title,
          fontSize: OrderDetailFontSize.textSizeSMedium,
          fontWeight: FontWeight.w700,
          color: color),
    );
  }

  //appbar layout
  PreferredSizeWidget appBarLayout(
      {var backgroundColor,
      var titleColor,
      String? image,
      GestureTapCallback? onTap}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderDetailWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          image: image),
      title: OrderDetailWidget().appBarTitleLayout(
          text: OrderDetailFont().orderSummary, textColor: titleColor),
      actions: [
        OrderDetailWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}

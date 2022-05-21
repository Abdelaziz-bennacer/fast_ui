import 'package:fast_ui/common/app_screen_util.dart';
import 'package:fast_ui/views/pages/shop/util/shop_constants.dart';
import 'package:fast_ui/views/pages/shop/util/shop_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/assets/index.dart';
import '../../../../extensions/spacing.dart';

//Widget Layout
class ShopWidget {
  //textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: AppScreenUtil().screenWidth(20)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: fillcolor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
              fontSize: AppScreenUtil().fontSize(15),
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //shop layout
  Widget shopLayout({Widget? child, context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(10),
      ),
      child: child,
    );
  }

  //voice icon layout
  Widget voiceIcon(color, image) {
    return Image.asset(
      image,
      fit: BoxFit.contain,
      color: color,
      height: AppScreenUtil().screenHeight(10),
      width: AppScreenUtil().screenWidth(10),
    );
  }

  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                right: AppScreenUtil().screenWidth(8)),
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
        Image.asset(
          image!,
          height: AppScreenUtil().screenHeight(16),
          fit: BoxFit.contain,
        )
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return ShopFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(10),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 10 : 15),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 10 : 15),
          right: AppScreenUtil().screenWidth(10)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          gifAssets.colorOffer,
          height: AppScreenUtil().screenHeight(25),
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
        bottom: AppScreenUtil().screenHeight(8),
      ),
      height: AppScreenUtil().screenHeight(38),
      child: child,
    );
  }

  //amount button layout
  Widget amountButtonLayout(
      {context, var buttonColor, var itemColor, GestureTapCallback? onTap}) {
    return Container(
      height: AppScreenUtil()
          .screenHeight(AppScreenUtil().screenActualWidth() > 377 ? 53 : 57),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopFontStyle().mulishtextLayout(
                  text: '2 Items',
                  color: itemColor,
                  fontSize: ShopFontSize.textSizeSmall),
              const Space(0, 5),
              ShopFontStyle().mulishtextLayout(
                  text: ShopFont().dollar + "250.00",
                  color: itemColor,
                  fontSize: ShopFontSize.textSizeSMedium),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                ShopFontStyle().mulishtextLayout(
                    text: ShopFont().viewCart,
                    color: itemColor,
                    fontSize: ShopFontSize.textSizeSMedium),
                const Space(5, 0),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: itemColor,
                  size: AppScreenUtil().size(18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //range value common
  Widget rangeValue(
      {String? text, var containerColor, var borderColor, var textColor}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenWidth(5),
          horizontal: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
        border: Border.all(
            color: borderColor, width: .5), //border of dropdown button
      ),
      child: ShopFontStyle().mulishtextLayout(
          text: ShopFont().dollar + text!,
          fontSize: ShopFontSize.textSizeSmall,
          color: textColor),
    );
  }

  //decorated box layout
  Widget decoratedBoxLayout(
      {var wishtListBoxColor, var borderColor, Widget? child}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: wishtListBoxColor,
        //background color of dropdown button
        border: Border.all(color: borderColor, width: .5),
        //border of dropdown button
        borderRadius: BorderRadius.circular(
            AppScreenUtil().borderRadius(5)), //border raiuds of dropdown button
      ),
      child: child,
    );
  }

  //pop layout
  Widget popLayout(
      {Widget? child,
      var categoryTextColor,
      var primaryColor,
      Widget? packageSize,
      Widget? rangeSlider,
      Widget? buttonLayout,
      context}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
        ),
        height: MediaQuery.of(context).size.height / 1.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShopFontStyle().mulishtextLayout(
                      text: ShopFont().category,
                      fontSize: ShopFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600,
                      color: categoryTextColor),
                  ShopFontStyle().mulishtextLayout(
                      text: ShopFont().reset,
                      fontSize: ShopFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ],
              ),
              const Space(0, 20),
              child!,
              const Space(0, 20),
              ShopFontStyle().mulishtextLayout(
                  text: ShopFont().packSize,
                  fontSize: ShopFontSize.textSizeSMedium,
                  fontWeight: FontWeight.w600,
                  color: categoryTextColor),
              const Space(0, 20),
              packageSize!,
              const Space(0, 20),
              ShopFontStyle().mulishtextLayout(
                  text: ShopFont().priceRange,
                  fontSize: ShopFontSize.textSizeSMedium,
                  fontWeight: FontWeight.w600,
                  color: categoryTextColor),
              const Space(0, 20),
              rangeSlider!,
              const Space(0, 20),
              buttonLayout!
            ],
          ),
        ));
  }

  //common button widget
  Widget commonButtonWidget(
      {context,
      Color? containerColor,
      Color? borderColor,
      Color? textColor,
      String? text}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenWidth(13),
          horizontal: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
        border: Border.all(
            color: borderColor!, width: .5), //border of dropdown button
      ),
      child: ShopFontStyle().mulishtextLayout(
          text: text,
          textAlign: TextAlign.center,
          fontSize: ShopFontSize.textSizeSmall,
          color: textColor),
    );
  }
}

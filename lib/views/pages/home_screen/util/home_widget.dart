import 'package:fast_ui/config.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/home_screen/coupon_card.dart';
import 'package:fast_ui/views/pages/home_screen/everyday_essential_card.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_constants.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class HomeWidget {
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

  //recently bought widget
  Widget recentlyBought({String? text, color}) {
    return HomeFontStyle()
        .mulishtextLayout(text: text, color: color, fontSize: 14);
  }

  //shop by category widget
  Widget shopByCategory({String? text, color}) {
    return HomeFontStyle().mulishtextLayout(
        text: text, color: color, fontSize: 14, fontWeight: FontWeight.w800);
  }

//line border widget
  Widget lineBorderWidget({BuildContext? context, var bordercolor}) {
    return Container(
      child: SizedBox(
        width:
            MediaQuery.of(context!).size.width / AppScreenUtil().screenWidth(4),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: bordercolor, width: 2),
        ),
      ),
    );
  }

  //shop by category text layout widget
  Widget shopByCategoryText(
      {BuildContext? context, bordercolor, titlecolor, String? title}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          lineBorderWidget(context: context, bordercolor: bordercolor),
          HomeWidget().shopByCategory(text: title, color: titlecolor),
          lineBorderWidget(context: context, bordercolor: bordercolor),
        ],
      ),
    );
  }

  //common title and see all widget
  Widget commonTitleAndSeeAllWidget(
      {String? title, String? seeAllText, var seeAllColor, var textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeFontStyle().mulishtextLayout(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: textSizeSMedium,
            color: textColor),
        HomeFontStyle().mulishtextLayout(
            text: seeAllText,
            fontSize: 12,
            color: seeAllColor,
            fontWeight: FontWeight.w700),
      ],
    );
  }

  //offer list and content widget layout
  Widget offerListAndContentWidget(
      {BuildContext? context,
      var containerColor,
      var seeAllColor,
      var descriptionColor,
      bool? isBigScreen,
      child,
      var textColor}) {
    return Container(
      height: MediaQuery.of(context!).size.height *
          (AppScreenUtil().screenActualWidth() > 370 ? 62 : 70) /
          100,
      width: MediaQuery.of(context).size.width,
      color: containerColor,
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //say hello and see all  widget
          Padding(
            padding: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(25),
            ),
            child: HomeWidget().commonTitleAndSeeAllWidget(
                title: HomeFont().sayHelloToOffer,
                seeAllText: HomeFont().seeAll,
                textColor: textColor,
                seeAllColor: seeAllColor),
          ),
          //best price widget
          HomeWidget().commonDescriptionTextWidget(
              text: HomeFont().bestPriceEverOfAllTheTime,
              color: descriptionColor),
          child
        ],
      ),
    );
  }

  //lowest price and everyday essential container widget
  Widget lowestPriceAndEveryDayEssentialWidget(
      {Widget? child,
      var containerColor,
      BuildContext? context,
      bool? isBigScreen}) {
    return Container(
      color: containerColor,
      width: MediaQuery.of(context!).size.width,
      height: MediaQuery.of(context).size.height *
          (AppScreenUtil().screenActualWidth() > 370 ? 67 : 80) /
          100,
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: child,
    );
  }

  //lowest price and browser category button container widget
  Widget lowestPriceAndBrowseCategorylWidget(
      {Widget? child,
      var containerColor,
      BuildContext? context,
      bool? isBigScreen}) {
    return Container(
      color: containerColor,
      width: MediaQuery.of(context!).size.width,
      height:
          MediaQuery.of(context).size.height * (isBigScreen! ? 65 : 60) / 100,
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: child,
    );
  }

  //common description text Widget
  Widget commonDescriptionTextWidget({String? text, var color}) {
    return HomeFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.normal,
        fontSize: textSizeSmall,
        color: color);
  }

  //coupons layout widget
  Widget couponsWidget(
      {BuildContext? context,
      var containerColor,
      Widget? child,
      var seeAllColor,
      var descriptionColor,
      var primaryColor,
      var dottedLineColor,
      var decriptionColor,
      bool? isTheme,
      var titleColor}) {
    return Container(
      height: MediaQuery.of(context!).size.height * 30 / 100,
      width: MediaQuery.of(context).size.width,
      color: containerColor,
      padding: EdgeInsets.only(
        left: AppScreenUtil().screenWidth(15),
        right: AppScreenUtil().screenWidth(15),
        top: AppScreenUtil().screenHeight(20),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //everyday essential and see all  widget
          HomeWidget().commonTitleAndSeeAllWidget(
              title: HomeFont().coupensForYou,
              seeAllText: HomeFont().seeAll,
              seeAllColor: seeAllColor),

          //popular offers of the day text widget
          HomeWidget().commonDescriptionTextWidget(
              text: HomeFont().payLessGetMore, color: descriptionColor),
          SizedBox(
            height: MediaQuery.of(context).size.height * 20 / 100,
            child: ListView.builder(
              itemCount: AppArray().couponData.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CouponCard(
                    index: index,
                    isTheme: isTheme,
                    titleColor: titleColor,
                    couponModel: AppArray().couponData[index],
                    primaryColor: primaryColor,
                    dottedLineColor: dottedLineColor,
                    decriptionColor: decriptionColor);
              },
            ),
          ),
        ],
      ),
    );
  }

  //Common Horizontal list layout
  Widget commonHorizontalListLayout(
      {BuildContext? context,
      String? title,
      String? seeAllText,
      var data,
      var lowestPriceColor,
      var payLessColor,
      var containerBorderColor,
      var descriptionColor,
      var priceColor,
      var primaryColor,
      var boxColor,
      var iconColor,
      var shadowColor,
      bool? isBigScreen}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //everyday essential and see all  widget
        commonTitleAndSeeAllWidget(
            title: title,
            seeAllText: seeAllText,
            seeAllColor: lowestPriceColor),
        const Space(0, 5),
        //popular offers of the day text widget
        commonDescriptionTextWidget(
            text: HomeFont().payLessGetMore, color: payLessColor),
        //lowest price list
        SizedBox(
          height: MediaQuery.of(context!).size.height *
              (AppScreenUtil().screenActualWidth() > 370 ? 27 : 30) /
              100,
          child: ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return EveryDayEssentialCard(
                  index: index,
                  boxColor: boxColor,
                  shadowColor: shadowColor,
                  data: data[index],
                  containerBorderColor: containerBorderColor,
                  descriptionColor: descriptionColor,
                  priceColor: priceColor,
                  primaryColor: primaryColor,
                  iconColor: iconColor);
            },
          ),
        )
      ],
    );
  }

  //didn't find what you were looking for text
  Widget didntFindWhatLookingForLayout({var fontColor, String? text}) {
    return HomeFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w700,
        color: fontColor,
        fontSize: 22,
        overflow: TextOverflow.clip);
  }

  //browse category button layout
  Widget browseCategoryButtonLayout(
      {var buttonColor, var textColor, GestureTapCallback? onTap}) {
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
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: HomeFontStyle().mulishtextLayout(
            color: textColor,
            text: HomeFont().browseCategory,
            fontSize: 12,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

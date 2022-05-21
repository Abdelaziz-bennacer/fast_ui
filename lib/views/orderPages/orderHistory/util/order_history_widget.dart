import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_constants.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class OrderHistoryWidget {
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
    return OrderHistoryFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor,GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ?  15 : 20),
          top: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ?  13 : 20),
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
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(11),
        bottom: AppScreenUtil().screenHeight(11),
      ),
      height: AppScreenUtil().screenHeight(38),
      child: child,
    );
  }

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

  //days list card
  Widget daysListCard({var data,int? index,GestureTapCallback? onTap,int? selectIndex,color}){
    return Padding(
      padding: EdgeInsets.only(
          right: AppScreenUtil().screenWidth(12),
          left: AppScreenUtil()
              .screenWidth(index == 0 ? 15 : 0)),
      child: InkWell(
        onTap: onTap,
        child: OrderHistoryFontStyle().mulishtextLayout(
            text:data
            ['title'].toString(),
            fontSize: OrderHistoryFontSize.textSizeSMedium,
            fontWeight: FontWeight.normal,
            color: color),
      ),
    );
  }

  //voice icon layout
  Widget voiceIcon(color, image) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil()
              .screenHeight(AppScreenUtil()
              .screenActualWidth() >
              370
              ? 10
              : 6)),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
        color: color,
        height: AppScreenUtil().screenHeight(10),
        width: AppScreenUtil().screenWidth(10),
      ),
    );
  }


  //pop layout
  Widget popLayout(
      {Widget? child,
        var primaryColor,
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
        height: MediaQuery.of(context).size.height / 1.7,
        child: child);
  }

  //common text layout
  Widget commonTextLayout({String? text, var color,var fontWeight= FontWeight.w700}){
    return OrderHistoryFontStyle().mulishtextLayout(
        text: text,
        fontWeight: fontWeight,
        fontSize: OrderHistoryFontSize.textSizeSmall,
        color: color
    );
  }


  //common button widget
  Widget commonButtonWidget({context, var containerColor,var borderColor,var textColor,String? text}) {
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
            color: borderColor,
            width: .5), //border of dropdown button
      ),
      child: OrderHistoryFontStyle().mulishtextLayout(
          text: text,
          textAlign: TextAlign.center,
          fontSize: OrderHistoryFontSize.textSizeSmall,
          color: textColor),
    );
  }

  //rating layout
  Widget ratingLayout(
      {var ratingColor,
        var glowColor,
        var unratedColor,
        ValueChanged<double>? onRatingUpdate,
        double? value}) {
    return RatingBar.builder(
      itemSize: AppScreenUtil().size(20.0),
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glowColor: glowColor,
      itemPadding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(1),
          vertical: AppScreenUtil().screenHeight(5)),
      unratedColor: unratedColor,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }

  //app bar
 PreferredSizeWidget appbarLayout({var backgroundColor,var titleColor,String? image,GestureTapCallback? onTap}){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: OrderHistoryWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          image: image),
      title: OrderHistoryWidget().appBarTitleLayout(
          text: OrderHistoryFont().orderHistory,
          textColor: titleColor),
      actions: [
        OrderHistoryWidget().appBarActionLayout(
            iconColor: titleColor,onTap: onTap),
      ],
    );
 }

}

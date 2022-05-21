import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/search/util/search_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class SearchWidget {
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

  //recent search text
  Widget recentSearchText({text, color}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: SearchFontStyle().mulishtextLayout(
          text: text, fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  //Trending category text
  Widget trendingCategoryText({text, color}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: SearchFontStyle().mulishtextLayout(
          text: text, fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  //Trending Product text
  Widget trendingProductText({text, color}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: SearchFontStyle().mulishtextLayout(
          text: text, fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  //recent search layout
  Widget recentSearchLayout(child, context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          top: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      height: AppScreenUtil().screenHeight(30),
      child: child,
    );
  }

  //trending category layout
  Widget trendingCategoryLayout(child) {
    return Container(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(2)),
      margin: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          top: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      height: AppScreenUtil().screenHeight(55),
      child: child,
    );
  }

  //recent list card
  Widget recentListCard({data, color}) {
    return Container(
      height: AppScreenUtil().screenHeight(30),
      margin: EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(25),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: SearchFontStyle().mulishtextLayout(
          text: data['title'], textAlign: TextAlign.center, fontSize: 12),
    );
  }

  //trending product list card
  Widget trendingProductCard({data, color, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        height: AppScreenUtil().screenHeight(50),
        width: AppScreenUtil().screenWidth(90),
        margin: EdgeInsets.only(right: AppScreenUtil().screenWidth(20)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(12),
            vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
            border: Border.all(color: data.color, width: 2),
            color: data.containercolor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: Image.asset(
          data.image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

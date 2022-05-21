import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/myCart/util/mycart_fontstyle.dart';
import 'package:fast_ui/views/pages/myCart/util/mycart_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class MyCartWidget {
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

  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image,
      String? text,
      var textColor}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 27),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 27),
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
        MyCartFontStyle().mulishtextLayout(
            text: text,
            fontWeight: FontWeight.w600,
            fontSize: MyCartFontSize.textSizeSMedium,
            color: textColor)
      ],
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return MyCartFontStyle().mulishtextLayout(
      text: text,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: textColor,
    );
  }

  //appbar action layout
  Widget appBarActionLayout({GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: AppScreenUtil()
              .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 6 : 0),
          top: AppScreenUtil()
              .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 8 : 2),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.drawerHome,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //popup detail layout
  Widget bottomSheetLayout({Widget? child, var primaryColor}) {
    return Container(
      height: AppScreenUtil().screenHeight(150),
      padding: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(25),
          left: AppScreenUtil().screenWidth(20),
          right: AppScreenUtil().screenWidth(20)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      child: child,
    );
  }

  //code display layout
  Widget codeLayout({Widget? child, var lightPrimary}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: lightPrimary,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: child,
    );
  }

  //copy Code style
  Widget copyCodeButton({text, var whiteColor, var primaryColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(12),
          vertical: AppScreenUtil().screenHeight(6)),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(50))),
      child: MyCartFontStyle().mulishtextLayout(
          text: text,
          color: primaryColor,
          fontSize: MyCartFontSize.textSizeSMedium,
          fontWeight: FontWeight.bold),
    );
  }

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return MyCartFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: MyCartFontSize.textSizeSMedium,
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
        MyCartWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        MyCartWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

  //aapbar
  PreferredSizeWidget appBarLayout(
      {var backgroundColor,
      String? image,
      GestureTapCallback? onTap,
      GestureTapCallback? actionOnTap,
      var titleColor,
      var darkContentColor}) {
    return AppBar(
      titleSpacing: 5,
      toolbarHeight: AppScreenUtil().screenHeight(30),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: AppScreenUtil().screenWidth(105),
      backgroundColor: backgroundColor,
      centerTitle: false,
      leading: MyCartWidget().appBarLeadingLayput(
          onTap: onTap,
          borderColor: titleColor,
          iconColor: titleColor,
          image: image,
          text: MyCartFont().myCart,
          textColor: titleColor),
      title: MyCartWidget()
          .appBarTitleLayout(text: "(4 Items)", textColor: darkContentColor),
      actions: [
        MyCartWidget().appBarActionLayout(onTap: actionOnTap),
      ],
    );
  }

  //procees to Checkout button
  Widget proceedToCheckout({context, var containerColor, var textColor}) {
    return InkWell(
      onTap: () => Get.toNamed(routeName.addAddress),
      child: Container(
        height: AppScreenUtil().screenHeight(45),
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(12)),
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenHeight(15)),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(10)),
        child: MyCartFontStyle().mulishtextLayout(
            text: MyCartFont().proceedtoCheckout,
            fontSize: 12,
            color: textColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

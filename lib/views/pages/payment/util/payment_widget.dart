import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/payment/util/payment_constants.dart';
import 'package:fast_ui/views/pages/payment/util/payment_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class PaymentWidget {
  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return PaymentFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: PaymentFontSize.textSizeSmall,
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
        PaymentWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        PaymentWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

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
    return PaymentFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //proceedPayment button layout
  Widget proceedPaymentButtonLayout(
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
        child: PaymentFontStyle().mulishtextLayout(
            text: PaymentFont().confirmPayment,
            color: itemColor,
            fontSize: PaymentFontSize.textSizeMedium),
      ),
    );
  }

  //add address layout
  Widget addAddressLayout(
      {context, var borderColor, var color, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: color),
            PaymentFontStyle().mulishtextLayout(
                text: PaymentFont().addAddress,
                fontSize: PaymentFontSize.textSizeSMedium,
                color: color),
          ],
        ),
      ),
    );
  }

  //check icon Layout
  Widget checkIcon({var iconColor, var containerColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(3),
          vertical: AppScreenUtil().screenHeight(2)),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(5)),
              bottomLeft: Radius.circular(AppScreenUtil().borderRadius(5)))),
      child: Icon(
        Icons.check,
        size: AppScreenUtil().size(16),
        color: iconColor,
      ),
    );
  }

  //expandable list view
  Widget expandableListView(
      {context,
      int? index,
      String? title,
      bool? isExpanded,
      var lightPrimary,
      var titleColor,
      VoidCallback? onPressed,
      Widget? child}) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PaymentFontStyle().mulishtextLayout(
                    text: title,
                    fontSize: PaymentFontSize.textSizeSMedium,
                    fontWeight: FontWeight.w700),
                IconButton(
                    icon: Container(
                      height: AppScreenUtil().screenHeight(25),
                      width: AppScreenUtil().screenWidth(25),
                      decoration: BoxDecoration(
                        color: lightPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isExpanded!
                            ? Icons.keyboard_arrow_down
                            : Icons.arrow_forward_ios_outlined,
                        color: titleColor,
                        size: AppScreenUtil().size(isExpanded ? 18 : 13),
                      ),
                    ),
                    onPressed: onPressed),
              ],
            ),
          ),
        ),
        childExpandable(
            context: context,
            collapsedHeight: 0.0,
            expandedHeight: AppScreenUtil().screenHeight(index == 0
                ? 190.0
                : index == 1 || index == 2
                    ? 130
                    : 60),
            expanded: isExpanded,
            child: child)
      ],
    );
  }

  // child expandable layout
  Widget childExpandable(
      {context,
      bool? expanded,
      expandedHeight = 300.0,
      collapsedHeight = 0.0,
      Widget? child}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: screenWidth,
          height: expanded! ? expandedHeight : collapsedHeight,
          child: Container(
            child: child,
            /*decoration:
            BoxDecoration(border: Border.all(width: 0.5, color: borderColor)),*/
          ),
        ),
        if (!expanded)
          const Divider(
            height: 1,
            indent: 15,
            endIndent: 15,
          )
      ],
    );
  }

  //textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      Widget? suffixIcon,
      TextEditingController? controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: AppScreenUtil().screenWidth(20)),
          suffixIcon: suffixIcon,
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
              fontSize: AppScreenUtil().fontSize(12),
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //common button widget
  Widget commonButtonWidget(
      {context,
      var containerColor,
      var borderColor,
      var textColor,
      String? text,
      GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenWidth(13),
            horizontal: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          border: Border.all(
              color: borderColor, width: .5), //border of dropdown button
        ),
        child: PaymentFontStyle().mulishtextLayout(
            text: text,
            textAlign: TextAlign.center,
            fontSize: PaymentFontSize.textSizeSmall,
            color: textColor),
      ),
    );
  }

  //price detail layout
  Widget priceDetailLayout({var boxColor, Widget? child}) {
    return Container(
        height: AppScreenUtil().screenHeight(
            AppScreenUtil().screenActualWidth() > 370 ? 200 : 220),
        margin: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(15),
            left: AppScreenUtil().screenWidth(15),
            right: AppScreenUtil().screenWidth(15),
            bottom: AppScreenUtil().screenHeight(20)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(15),
            horizontal: AppScreenUtil().screenWidth(15)),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: child);
  }
}

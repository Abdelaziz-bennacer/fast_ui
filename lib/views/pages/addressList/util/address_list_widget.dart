import 'package:flutter/material.dart';

import '../../../../common/app_screen_util.dart';
import '../../../../common/assets/index.dart';
import '../../../../extensions/spacing.dart';
import 'address_list_constants.dart';
import 'address_list_fontstyle.dart';

//Widget Layout
class AddressListWidget {
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
    return AddressListFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(13),
          top: AppScreenUtil().screenHeight(13),
          right: AppScreenUtil().screenWidth(15)),
      child: Image.asset(
        iconAssets.blacktextboxSearchIcon,
        color: iconColor,
        height: AppScreenUtil().screenHeight(20),
        fit: BoxFit.contain,
      ),
    );
  }

  //proceedPayment button layout
  Widget proceedPaymentButtonLayout({context, var buttonColor, var itemColor}) {
    return Container(
      height: AppScreenUtil().screenHeight(50),
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
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: AddressListFontStyle().mulishtextLayout(
          text: AddressListFont().proceedToPayment,
          color: itemColor,
          fontSize: AddressListFontSize.textSizeMedium),
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
            AddressListFontStyle().mulishtextLayout(
                text: AddressListFont().addAddress,
                fontSize: AddressListFontSize.textSizeSMedium,
                color: color),
          ],
        ),
      ),
    );
  }

  //icon and place layout
  Widget iconAndPlaceLayout(
      {String? text,
      var textColor,
      int? index,
      var defaultBoxColor,
      var defaultTextColor}) {
    return Row(
      children: [
        Image.asset(
          iconAssets.work,
          color: textColor,
          height: AppScreenUtil().screenHeight(20),
        ),
        const Space(8, 0),
        AddressListFontStyle().mulishtextLayout(
            text: text,
            fontSize: AddressListFontSize.textSizeSMedium,
            color: textColor,
            fontWeight: FontWeight.w700),
        const Space(8, 0),
        if (index == 0)
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(2),
                horizontal: AppScreenUtil().screenWidth(15)),
            decoration: BoxDecoration(
                color: defaultBoxColor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(50))),
            child: AddressListFontStyle().mulishtextLayout(
                text: AddressListFont().defaultTitle,
                fontSize: AddressListFontSize.textXSizeSmall,
                color: defaultTextColor,
                fontWeight: FontWeight.normal),
          )
      ],
    );
  }
}

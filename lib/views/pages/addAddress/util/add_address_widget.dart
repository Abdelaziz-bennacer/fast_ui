import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_address_constants.dart';
import 'add_address_fontstyle.dart';

//Widget Layout
class AddAddressWidget {
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
    return AddAddressFontStyle().mulishtextLayout(
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
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 13 : 20),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.blacktextboxSearchIcon,
          color: iconColor,
          height: AppScreenUtil().screenHeight(18),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //confirm Location layout
  Widget confirmLocationButtonLayout(
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
        child: AddAddressFontStyle().mulishtextLayout(
            text: AddAddressFont().confirmLocation,
            color: itemColor,
            fontSize: AddAddressFontSize.textSizeMedium),
      ),
    );
  }

  //background layout
  Widget backgroundLayout(
      {context,
      var containerColor,
      var textColor,
      var iconColor,
      String? icon}) {
    return Stack(
      children: [
        Image.asset(
          imageAssets.map,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(12),
              left: AppScreenUtil().screenWidth(15),
              right: AppScreenUtil().screenWidth(15)),
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenWidth(12)),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: Row(
            children: [
              Image.asset(
                icon!,
                height: AppScreenUtil().screenHeight(15),
                color: textColor,
              ),
              const Space(10, 0),
              AddAddressFontStyle().mulishtextLayout(
                  text: 'Delivery on 7th Aug, Slot: 7am to 9am',
                  fontSize: AddAddressFontSize.textSizeSMedium,
                  color: textColor)
            ],
          ),
        ),
        Positioned(
          right: 15,
          top: MediaQuery.of(context).size.width / 1.4,
          child: FloatingActionButton(
              elevation: 0.0,
              child: Image.asset(
                iconAssets.crosshair,
                height: AppScreenUtil().screenHeight(25),
              ),
              backgroundColor: containerColor,
              onPressed: () {}),
        ),
      ],
    );
  }

  //content background layout
  Widget contentBGLayout({var color, Widget? child, context}) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
      child: child,
    );
  }

  //send location layout
  Widget sendLocationLayout({var boxColor, String? icon}) {
    return Container(
      margin: EdgeInsets.only(left: AppScreenUtil().screenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(8)),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Image.asset(
        icon!,
        height: AppScreenUtil().screenHeight(18),
      ),
    );
  }

  //address list card
  Widget addressListCard(
      {data,
      var addressColor,
      var darkContentColor,
      var dividerColor,
      int? lastIndex,
      var iconColor,
      int? index}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                iconAssets.addreesslocation,
                fit: BoxFit.fitWidth,
                height: AppScreenUtil().screenHeight(16),
                color: iconColor,
              ),
              const Space(8, 0),
              AddAddressFontStyle().mulishtextLayout(
                  text: data['address'],
                  fontSize: AddAddressFontSize.textSizeSMedium,
                  color: addressColor)
            ],
          ),
          const Space(0, 8),
          AddAddressFontStyle().mulishtextLayout(
              text: data['area'],
              fontSize: AddAddressFontSize.textSizeSmall,
              color: darkContentColor),
          const Space(0, 10),
          if (index != lastIndex)
            Divider(
              color: dividerColor,
            )
        ],
      ),
    );
  }

  //appbar layout
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap, var bgColor, var titleColor, String? image}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: AddAddressWidget().appBarLeadingLayput(
          onTap: () => Get.back(),
          borderColor: titleColor,
          iconColor: titleColor,
          image: image),
      title: AddAddressWidget().appBarTitleLayout(
          text: AddAddressFont().addAddress, textColor: titleColor),
      actions: [
        AddAddressWidget()
            .appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}

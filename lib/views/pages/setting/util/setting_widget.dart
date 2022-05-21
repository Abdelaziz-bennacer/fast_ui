import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/setting/util/setting_constants.dart';
import 'package:fast_ui/views/pages/setting/util/setting_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class SettingWidget {
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
    return SettingFontStyle().mulishtextLayout(
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

//textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      TextEditingController? controller,
      Widget? suffixIcon,
      FormFieldValidator<String>? validator,
      ValueChanged<String>? onFieldSubmitted,
      FocusNode? focusNode,
      bool isLargeScreen = false,
      bool obscureText = true,
      TextInputAction? textInputAction,
      TextInputType? keyboardType,
      GestureTapCallback? onTap,
      bool readOnly = false,
      int? maxLength}) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(14),
            horizontal: AppScreenUtil().size(20)),
        suffixIcon: suffixIcon,
        fillColor: fillcolor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        hintText: text,
        hintStyle: TextStyle(
            fontSize: 15,
            color: hintColor,
            fontFamily: GoogleFonts.mulish().fontFamily),
      ),
    );
  }

  //edit icon layout
  Widget editIcon({context, var primaryColor}) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .8 / 10,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(6),
              vertical: AppScreenUtil().screenHeight(5)),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(60))),
          child: Image.asset(
            iconAssets.edit,
            height: AppScreenUtil().screenHeight(18),
          )),
    );
  }

  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //change password text
  Widget changePassWord({var color}) {
    return SettingFontStyle().mulishtextLayout(
        text: SettingFont().changePassword,
        fontWeight: FontWeight.w700,
        fontSize: SettingFontSize.textSizeSmall,
        color: color);
  }

  //password layot
  Widget passwordLayout({Widget? child, var textBoxColor, borderColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppScreenUtil().screenHeight(12),
      ),
      decoration: BoxDecoration(
          color: textBoxColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          border: Border.all(color: borderColor)),
      child: child,
    );
  }

  //update setting layout
  Widget updateSettingLayout(
      {GestureTapCallback? onTap, var color, var textColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(15)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(5))),
        child: SettingFontStyle().mulishtextLayout(
            text: SettingFont().updateSettings,
            fontSize: SettingFontSize.textSizeSmall,
            color: textColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  //common appbar
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap, var bgColor, var titleColor, var text}) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: bgColor,
      titleSpacing: 0,
      centerTitle: false,
      leading: SettingWidget().appBarLeadingLayput(
        onTap: () => Get.back(),
        borderColor: titleColor,
        iconColor: titleColor,
      ),
      title:
          SettingWidget().appBarTitleLayout(text: text, textColor: titleColor),
      actions: [
        SettingWidget().appBarActionLayout(iconColor: titleColor, onTap: onTap),
      ],
    );
  }
}

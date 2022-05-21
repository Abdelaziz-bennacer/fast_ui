import 'package:flutter/material.dart';

import '../../utilities/color_utils.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color txt;
  Color primary;
  Color secondary;
  Color accentTxt;
  Color whiteColor;
  Color surface;
  Color error;

  //Extra Colors
  Color bgGray;
  Color gray;
  Color darkGray;
  Color lightGray;
  Color borderGray;
  Color green;
  Color white;
  Color lightPrimary;
  Color greyBGColor;
  Color titleColor;
  Color bannerTitleColor;
  Color bannerDescColor;
  Color contentColor;
  Color darkContentColor;
  Color ratingColor;
  Color borderColor;
  Color recentBGColor;
  Color iconColor;
  Color socialColor;
  Color drawerSelectColor;
  Color arrowSelectColor;
  Color textBoxColor;
  Color offerBoxColor;
  Color couponBoxColor;
  Color blackColor;
  Color backColor;
  Color wishtListBoxColor;
  Color redColor;
  Color popUpColor;
  Color lowestBgColor;
  Color paymentBgColor;
  Color iconBgColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.txt,
    required this.primary,
    required this.secondary,
    required this.accentTxt,
    required this.whiteColor,
    required this.surface,
    required this.error,
    //Extra
    required this.bgGray,
    required this.gray,
    required this.darkGray,
    required this.lightGray,
    required this.borderGray,
    required this.green,
    required this.white,
    required this.lightPrimary,
    required this.greyBGColor,
    required this.titleColor,
    required this.contentColor,
    required this.darkContentColor,
    required this.ratingColor,
    required this.borderColor,
    required this.recentBGColor,
    required this.iconColor,
    required this.socialColor,
    required this.drawerSelectColor,
    required this.arrowSelectColor,
    required this.textBoxColor,
    required this.bannerTitleColor,
    required this.bannerDescColor,
    required this.offerBoxColor,
    required this.couponBoxColor,
    required this.blackColor,
    required this.backColor,
    required this.wishtListBoxColor,
    required this.redColor,
    required this.popUpColor,
    required this.lowestBgColor,
    required this.paymentBgColor,
    required this.iconBgColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          txt: const Color(0xFF001928),
          primary: const Color(0xFF0BAF9A),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          whiteColor: const Color(0xFFFFFFFF),
          surface: Colors.white,
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFFF0F8FD),
          gray: const Color(0xFF999999),
          darkGray: const Color(0xFF666666),
          lightGray: const Color(0xFFFAFAFA),
          borderGray: const Color(0xFFE6E8EA),
          green: Colors.green,
          white: Colors.white,
          lightPrimary: const Color(0xFFEDF8F8),
          greyBGColor: const Color(0xFFF1F1F1),
          titleColor: const Color(0xFF222222),
          contentColor: const Color(0xFFCACACA),
          darkContentColor: const Color(0xFF777777),
          ratingColor: const Color(0xFFFFBF13),
          borderColor: const Color(0xFFF1F1F1),
          recentBGColor: const Color(0xFFE9FFFF),
          iconColor: Colors.black,
          socialColor: const Color(0xFFFAFAFA),
          drawerSelectColor: Colors.white,
          arrowSelectColor: const Color(0xFFEDF8F8),
          textBoxColor: const Color(0xFFFAFAFA),
          bannerTitleColor: Colors.black,
          bannerDescColor: const Color(0xFF777777),
          offerBoxColor: const Color(0xFFEDF8F8),
          couponBoxColor: const Color(0xFFEDF8F8),
          blackColor: Colors.white,
          backColor: Colors.black,
          wishtListBoxColor: const Color(0xFFFAFAFA),
          redColor: Colors.red,
          popUpColor: Colors.white,
          lowestBgColor: const Color(0xFFEDF8F8),
          paymentBgColor: Colors.white,
          iconBgColor: const Color(0xFFEDF8F8),
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          txt: Colors.white,
          primary: const Color(0xFF0BAF9A),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          whiteColor: Colors.black,
          surface: const Color(0xFF151A1E),
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFF262F36),
          gray: const Color(0xFF999999),
          darkGray: const Color(0xFFCACACA),
          lightGray: const Color(0xFFFAFAFA),
          borderGray: const Color(0xFF353C41),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          lightPrimary: const Color(0xFFA9A9A9),
          greyBGColor: const Color(0xFFF1F1F1),
          titleColor: Colors.white,
          contentColor: const Color(0xFFCACACA),
          darkContentColor: const Color(0xFF777777),
          ratingColor: const Color(0xFFFFBF13),
          borderColor: const Color(0xFFF1F1F1),
          recentBGColor: const Color(0xFFE9FFFF),
          iconColor: Colors.white,
          socialColor: const Color(0xFF292E33),
          drawerSelectColor: Colors.white,
          arrowSelectColor: const Color(0xFF292E33),
          textBoxColor: const Color(0xFF292E33),
          bannerTitleColor: Colors.black,
          bannerDescColor: const Color(0xFF777777),
          offerBoxColor: const Color(0xFF262B2F),
          couponBoxColor: const Color(0xFF262B2F),
          blackColor: const Color(0xFF1A1E20),
          backColor: const Color(0xFF777777),
          wishtListBoxColor: const Color(0xFF262B2F),
          redColor: Colors.red,
          popUpColor: const Color(0xFF1F2427),
          lowestBgColor: const Color(0xFF262B2F),
          paymentBgColor: const Color(0xFF242224),
          iconBgColor: Colors.black,
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: shiftHsl(primary, -.2),
        secondary: secondary,
        secondaryContainer: shiftHsl(secondary, -.2),
        background: whiteColor,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: borderGray,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
      toggleableActiveColor: primary,
    );
  }

//Color shift(Color c, double d) => shiftHsl(c, d * (isDark ? -1 : 1));
}

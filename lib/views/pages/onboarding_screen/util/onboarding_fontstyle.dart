import 'package:fast_ui/views/pages/onboarding_screen/util/onboarding_constants.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';

//Quick Sand Text Style Widget
class QuickSandTextWidget extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final String? text;

  QuickSandTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: TextAlign.center,
        style: AppCss().quicksandTextStyle(
            color: appCtrl.appTheme.titleColor,
            fontSize: 20,
            fontWeight: FontWeight.w500));
  }
}

//Nunito Sans Text Widget style
class NunitoSansTextWidget extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final String? text;

  NunitoSansTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: AppCss().nunitoTextStyle(
          color: appCtrl.appTheme.contentColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
    );
  }
}

//Mulish Text Widget style
class MulishTextWidget extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final String? text;

  MulishTextWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: TextAlign.center,
        style: AppCss().mulishTextStyle(
            color: appCtrl.appTheme.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold));
  }
}

class OnboardingFontStyle {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //nunito and quick sand font family text layout
  Widget nunitoAndQuicksandtextLayout(
      {String? text,
      color,
      double fontSize = textSizeMedium,
      FontWeight fontWeight = FontWeight.normal,
      String? type}) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: type == 'nunito'
          ? AppCss().nunitoTextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight)
          : AppCss().quicksandTextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

//mulish font family text layout
  Widget mulishtextLayout({
    String? text,
    color,
    double fontSize = textSizeMedium,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration textDecoration = TextDecoration.none,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(text!,
          style: AppCss().mulishTextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: textSizeMedium,
              textDecoration: textDecoration)),
    );
  }
}

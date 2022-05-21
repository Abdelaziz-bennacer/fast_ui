import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconButtonWidget extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? icon;
  Widget? textWidget;
  String? type;
  double? lefMargin;
  double? rightMargin;
  GestureTapCallback? onTap;

  IconButtonWidget(
      {Key? key,
      this.icon,
      this.textWidget,
      this.type,
      this.lefMargin,
      this.rightMargin,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppScreenUtil().size(12)),
        decoration: BoxDecoration(
            color: appCtrl.appTheme.socialColor,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon!,
              height: AppScreenUtil().screenHeight(20),
            ),
            const Space(10, 0),
            textWidget!
          ],
        ),
      ).marginOnly(
          left: AppScreenUtil().screenWidth(lefMargin!),
          right: AppScreenUtil().screenWidth(rightMargin!)),
    );
  }
}

import 'package:fast_ui/views/pages/payment/util/payment_constants.dart';
import 'package:fast_ui/views/pages/payment/util/payment_fontstyle.dart';
import 'package:fast_ui/views/pages/payment/util/payment_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class CashOnDeliveryLayout extends StatelessWidget {
  final Color? titleColor;
  final Color? contentColor;
  final Color? wishtListBoxColor;
  final Color? containerColor;
  final Color? primary;
  const CashOnDeliveryLayout(
      {Key? key,
      this.titleColor,
      this.contentColor,
      this.wishtListBoxColor,
      this.primary,
      this.containerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppScreenUtil().screenWidth(15),
        right: AppScreenUtil().screenWidth(15),
        top: AppScreenUtil().screenHeight(12.0),
      ),
      decoration: BoxDecoration(
          color: wishtListBoxColor,
          borderRadius: BorderRadius.circular(
              AppScreenUtil().borderRadius(AppScreenUtil().borderRadius(5))),
          border: Border.all(color: primary!)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(10),
                  vertical: AppScreenUtil().screenHeight(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaymentFontStyle().nunitotextLayout(
                      text: PaymentFont().cashonDelivery,
                      fontWeight: FontWeight.w700,
                      fontSize: PaymentFontSize.textSizeSMedium,
                      color: titleColor),
                ],
              )),
          PaymentWidget()
              .checkIcon(iconColor: containerColor, containerColor: primary)
        ],
      ),
    );
  }
}

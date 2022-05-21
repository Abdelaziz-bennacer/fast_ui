import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_constants.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

// ignore: must_be_immutable
class OrderHistoryCard extends StatelessWidget {
  int? index;
  int? selectedIndex;
  final dynamic data;
  final Color? containerColor;
  final Color? titleColor;
  final Color? primaryColor;
  final Color? dividerColor;
  final Color? darkContentColor;
  final Color? glowColor;
  final Color? unratedColor;
  final Color? ratingColor;
  GestureTapCallback? onTap;
  GestureTapCallback? priceTap;

  OrderHistoryCard(
      {Key? key,
      this.index,
      this.selectedIndex,
      this.data,
      this.containerColor,
      this.titleColor,
      this.primaryColor,
      this.dividerColor,
      this.darkContentColor,
      this.ratingColor,
      this.glowColor,
      this.unratedColor,
      this.onTap,
      this.priceTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(15),
            horizontal: AppScreenUtil().screenWidth(15)),
        decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
                color: selectedIndex == index ? primaryColor! : containerColor!,
                width: 1.5),
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        OrderHistoryWidget().commonTextLayout(
                            text: OrderHistoryFont().id, color: titleColor),
                        OrderHistoryWidget().commonTextLayout(
                            text: data['orderId'] + ' , ', color: titleColor),
                        OrderHistoryWidget().commonTextLayout(
                            text: OrderHistoryFont().dt, color: titleColor),
                        OrderHistoryWidget().commonTextLayout(
                            text: data['date'], color: titleColor),
                      ],
                    ),
                    const Space(0, 8),
                    OrderHistoryWidget().commonTextLayout(
                        text: data['address'],
                        color: darkContentColor,
                        fontWeight: FontWeight.normal),
                    const Space(0, 8),
                    Row(
                      children: [
                        OrderHistoryWidget().commonTextLayout(
                            text: OrderHistoryFont().paid,
                            color: titleColor,
                            fontWeight: FontWeight.normal),
                        InkWell(
                          onTap: priceTap,
                          child: OrderHistoryWidget().commonTextLayout(
                              text: data['price'] + ' , ', color: primaryColor),
                        ),
                        OrderHistoryWidget().commonTextLayout(
                            text: OrderHistoryFont().items,
                            color: titleColor,
                            fontWeight: FontWeight.normal),
                        InkWell(
                          onTap: priceTap,
                          child: OrderHistoryWidget().commonTextLayout(
                              text: data['qty'], color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  iconAssets.map1,
                  height: AppScreenUtil().screenHeight(70),
                )
              ],
            ),
            const Space(0, 5),
            Divider(
              color: dividerColor,
            ),
            const Space(0, 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: onTap,
                    child: OrderHistoryWidget().commonTextLayout(
                        text: OrderHistoryFont().orderAgain,
                        color: titleColor,
                        fontWeight: FontWeight.w700)),
                index == 0
                    ? InkWell(
                        onTap: onTap,
                        child: OrderHistoryWidget().commonTextLayout(
                            text: OrderHistoryFont().rateReviewProduct,
                            color: darkContentColor,
                            fontWeight: FontWeight.normal))
                    : OrderHistoryWidget().ratingLayout(
                        glowColor: glowColor,
                        unratedColor: unratedColor,
                        ratingColor: ratingColor,
                        value: double.parse(data['rating'].toString()),
                        onRatingUpdate: (rating) {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

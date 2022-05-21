import 'package:fast_ui/controllers/order/order_detail_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/orderPages/orderDetail/item_list_card.dart';
import 'package:fast_ui/views/orderPages/orderDetail/util/order_detail_constants.dart';
import 'package:fast_ui/views/orderPages/orderDetail/util/order_detail_fontstyle.dart';
import 'package:fast_ui/views/orderPages/orderDetail/util/order_detail_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OrderDetail extends StatelessWidget {
  final orderDetailCtrl = Get.put(OrderDetailController());

  OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderDetailController>(builder: (_) {
          return Scaffold(
            appBar: OrderDetailWidget().appBarLayout(
                backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
                titleColor: orderDetailCtrl.appCtrl.appTheme.titleColor,
                image: orderDetailCtrl.appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo,
                onTap: () => orderDetailCtrl.goToHome()),
            backgroundColor: orderDetailCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: Container(
                color: orderDetailCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(80)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //order id and status layout
                            OrderDetailWidget().orderIdAndStatus(
                                color: orderDetailCtrl.appCtrl.appTheme.primary,
                                orderId: 'Order ID: #5151515',
                                textColor:
                                    orderDetailCtrl.appCtrl.appTheme.white),
                            const Space(0, 20),

                            // items text layout
                            OrderDetailWidget().commonTitleText(
                                title: OrderDetailFont().items,
                                color:
                                    orderDetailCtrl.appCtrl.appTheme.primary),
                            const Space(0, 20),

                            //item list layout
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              height: AppScreenUtil().screenHeight(
                                  AppScreenUtil().screenActualWidth() > 370
                                      ? 170
                                      : 220),
                              child: ListView.builder(
                                itemCount: AppArray().orderDetailList.length,
                                itemBuilder: (context, index) {
                                  return ItemListCard(
                                    data: AppArray().orderDetailList[index],
                                    quantityLayoutColor: orderDetailCtrl
                                        .appCtrl.appTheme.primary,
                                    quantityTextColor:
                                        orderDetailCtrl.appCtrl.appTheme.white,
                                    titleColor: orderDetailCtrl
                                        .appCtrl.appTheme.titleColor,
                                    darkContentColor: orderDetailCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    contentColor: orderDetailCtrl
                                        .appCtrl.appTheme.contentColor,
                                    index: index,
                                    lastIndex:
                                        AppArray().orderDetailList.length - 1,
                                  );
                                },
                              ),
                            ),
                            //payment detail text layout
                            OrderDetailWidget().commonTitleText(
                                title: OrderDetailFont().paymentDetails,
                                color:
                                    orderDetailCtrl.appCtrl.appTheme.primary),

                            // payment detail layout
                            OrderDetailWidget().priceDetailLayout(
                                child: Container(
                              margin: EdgeInsets.only(
                                  bottom: AppScreenUtil().screenHeight(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderDetailWidget().commonPriceDetail(
                                      title: OrderDetailFont().bagTotal,
                                      titleColor: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: OrderDetailFont().dollar + '220.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  const Space(0, 10),
                                  OrderDetailWidget().commonPriceDetail(
                                      title: OrderDetailFont().bagSavings,
                                      titleColor: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: '-${OrderDetailFont().dollar}20.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: orderDetailCtrl
                                          .appCtrl.appTheme.primary),
                                  const Space(0, 10),
                                  OrderDetailWidget().commonPriceDetail(
                                      title: OrderDetailFont().couponDiscount,
                                      titleColor: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: 'Apply Coupon',
                                      fontWeight: FontWeight.normal,
                                      valColor: orderDetailCtrl
                                          .appCtrl.appTheme.redColor),
                                  const Space(0, 10),
                                  OrderDetailWidget().commonPriceDetail(
                                      title: OrderDetailFont().delivery,
                                      titleColor: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      fontWeight: FontWeight.normal,
                                      val: OrderDetailFont().dollar + '50.00',
                                      valColor: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  const Space(0, 10),
                                  const Divider(),
                                  const Space(0, 10),
                                  OrderDetailWidget().commonPriceDetail(
                                      title: OrderDetailFont().totalAmount,
                                      titleColor: orderDetailCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontWeight: FontWeight.w600,
                                      val: OrderDetailFont().dollar + '270.00',
                                      valColor: orderDetailCtrl
                                          .appCtrl.appTheme.titleColor),
                                ],
                              ),
                            )),

                            //address text layout
                            OrderDetailWidget().commonTitleText(
                                title: OrderDetailFont().address,
                                color:
                                    orderDetailCtrl.appCtrl.appTheme.primary),

                            const Space(0, 15),

                            //address layout

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderDetailFontStyle().mulishtextLayout(
                                      text: "Noah Hamilton",
                                      fontSize:
                                          OrderDetailFontSize.textSizeSMedium,
                                      fontWeight: FontWeight.normal,
                                      color: orderDetailCtrl
                                          .appCtrl.appTheme.titleColor),
                                  const Space(0, 5),
                                  OrderDetailFontStyle().mulishtextLayout(
                                      text:
                                          "8857 Morris Rd.,Charlottesville, VA 22901",
                                      fontSize:
                                          OrderDetailFontSize.textSizeSmall,
                                      fontWeight: FontWeight.normal,
                                      color: orderDetailCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                ],
                              ),
                            ),
                            const Space(0, 3),

                            const Space(0, 20),
                            //payment text layout
                            OrderDetailWidget().commonTitleText(
                                title: OrderDetailFont().paymentMethod,
                                color:
                                    orderDetailCtrl.appCtrl.appTheme.primary),

                            const Space(0, 15),
                            //payment method layout
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    imageAssets.masterCard1,
                                    height: AppScreenUtil().screenHeight(30),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(15)),
                                    child: OrderDetailFontStyle()
                                        .mulishtextLayout(
                                            text: "**** **** **** 6502",
                                            fontSize: OrderDetailFontSize
                                                .textSizeSmall,
                                            fontWeight: FontWeight.normal,
                                            color: orderDetailCtrl
                                                .appCtrl.appTheme.titleColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //button layoot
                    OrderDetailWidget().reorderButtonLayout(
                        context: context,
                        onTap: () async {
                          await orderDetailCtrl.appCtrl.getStorage
                              .write('selectedIndex', 0);
                          orderDetailCtrl.appCtrl.selectedIndex = 0;
                          Get.offAllNamed(routeName.dashboard);
                        },
                        buttonColor: orderDetailCtrl.appCtrl.appTheme.primary,
                        itemColor: orderDetailCtrl.appCtrl.appTheme.white)
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}

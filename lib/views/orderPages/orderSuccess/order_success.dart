import 'package:fast_ui/controllers/order/order_success_controller.dart';
import 'package:fast_ui/views/drawer/drawer_screen.dart';
import 'package:fast_ui/views/orderPages/orderSuccess/util/order_success_constants.dart';
import 'package:fast_ui/views/orderPages/orderSuccess/util/order_success_fontstyle.dart';
import 'package:fast_ui/views/orderPages/orderSuccess/util/order_success_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OrderSuccess extends StatelessWidget {
  final orderSuccessCtrl = Get.put(OrderSuccessController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderSuccessController>(builder: (_) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: DrawerScreen(),
            appBar: OrderSuccesWidget().appBarLayout(
                bgColor: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                titleColor: orderSuccessCtrl.appCtrl.appTheme.titleColor,
                image: orderSuccessCtrl.appCtrl.isTheme
                    ? imageAssets.themeLogo
                    : imageAssets.logo,
                actionTap: () => orderSuccessCtrl.goToHome()),
            backgroundColor: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: Container(
                color: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(20),
                            vertical: AppScreenUtil().screenWidth(20)),
                        child: Column(
                          children: [
                            //success image layout
                            Image.asset(imageAssets.success),
                            const Space(0, 20),
                            //thankyou text layout
                            OrderSuccessFontStyle().quicksandtextLayout(
                                text: OrderSuccessFont().thankYou,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    OrderSuccessFontSize.textSizeLargeMedium,
                                color: orderSuccessCtrl
                                    .appCtrl.appTheme.titleColor),
                            const Space(0, 10),

                            //description layout
                            OrderSuccessFontStyle().mulishtextLayout(
                                text: OrderSuccessFont().des,
                                height: 1.5,
                                fontWeight: FontWeight.normal,
                                fontSize: OrderSuccessFontSize.textSizeSmall,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                color: orderSuccessCtrl
                                    .appCtrl.appTheme.darkContentColor),
                            const Space(0, 5),
                            Divider(
                              color: orderSuccessCtrl
                                  .appCtrl.appTheme.contentColor,
                            ),
                            const Space(0, 5),
                            //order date and id layout
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OrderSuccesWidget().commonLayout(
                                    containerColor: orderSuccessCtrl
                                        .appCtrl.appTheme.primary,
                                    titleColor: orderSuccessCtrl
                                        .appCtrl.appTheme.titleColor,
                                    darkContentColor: orderSuccessCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    image: iconAssets.calendar,
                                    title: OrderSuccessFont().orderDate,
                                    val: "Sun, 14 Apr, 19:12"),
                                OrderSuccesWidget().commonLayout(
                                    containerColor: orderSuccessCtrl
                                        .appCtrl.appTheme.primary,
                                    titleColor: orderSuccessCtrl
                                        .appCtrl.appTheme.titleColor,
                                    darkContentColor: orderSuccessCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    image: iconAssets.paper,
                                    title: OrderSuccessFont().orderId,
                                    val: "#548475151"),
                              ],
                            ),

                            //price detail
                            OrderSuccesWidget().priceDetailLayout(
                              boxColor: orderSuccessCtrl
                                  .appCtrl.appTheme.wishtListBoxColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderSuccessFontStyle().mulishtextLayout(
                                      text: OrderSuccessFont().orderDetails,
                                      color: orderSuccessCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontSize:
                                          OrderSuccessFontSize.textSizeMedium,
                                      fontWeight: FontWeight.w600),
                                  const Space(0, 15),
                                  OrderSuccesWidget().commonPriceDetail(
                                      title: OrderSuccessFont().bagTotal,
                                      titleColor: orderSuccessCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: OrderSuccessFont().dollar + '220.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: orderSuccessCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  const Space(0, 8),
                                  OrderSuccesWidget().commonPriceDetail(
                                      title: OrderSuccessFont().bagSavings,
                                      titleColor: orderSuccessCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: '-${OrderSuccessFont().dollar}20.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: orderSuccessCtrl
                                          .appCtrl.appTheme.primary),
                                  const Space(0, 8),
                                  OrderSuccesWidget().commonPriceDetail(
                                      title: OrderSuccessFont().couponDiscount,
                                      titleColor: orderSuccessCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: 'Apply Coupon',
                                      fontWeight: FontWeight.normal,
                                      valColor: orderSuccessCtrl
                                          .appCtrl.appTheme.redColor),
                                  const Space(0, 8),

                                  OrderSuccesWidget().commonPriceDetail(
                                      title: OrderSuccessFont().delivery,
                                      titleColor: orderSuccessCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      fontWeight: FontWeight.normal,
                                      val: OrderSuccessFont().dollar + '50.00',
                                      valColor: orderSuccessCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  const Space(0, 10),
                                  //divider layout
                                  const Divider(),
                                  const Space(0, 10),

                                  OrderSuccesWidget().commonPriceDetail(
                                      title: OrderSuccessFont().totalAmount,
                                      titleColor: orderSuccessCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontWeight: FontWeight.w600,
                                      val: OrderSuccessFont().dollar + '270.00',
                                      valColor: orderSuccessCtrl
                                          .appCtrl.appTheme.titleColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //track package button layout
                    OrderSuccesWidget().trackPackageButtonLayout(
                        context: context,
                        onTap: () => Get.toNamed(routeName.orderTrack),
                        buttonColor: orderSuccessCtrl.appCtrl.appTheme.primary,
                        itemColor: orderSuccessCtrl.appCtrl.appTheme.white)
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

import 'package:fast_ui/controllers/order/order_history_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/orderPages/orderHistory/order_history_card.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_constants.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_fontstyle.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OrderHistoryScreen extends StatelessWidget {
  final orderHistoryCtrl = Get.put(OrderHistoryController());

  OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<OrderHistoryController>(builder: (_) {
          return Scaffold(
            appBar: OrderHistoryWidget().appbarLayout(
                backgroundColor: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
                titleColor: orderHistoryCtrl.appCtrl.appTheme.titleColor,
                image: orderHistoryCtrl.appCtrl.isTheme
                    ? imageAssets.themeFkLogo
                    : imageAssets.fkLogo,
                onTap: () => orderHistoryCtrl.goToHome()),
            backgroundColor: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Container(
                  color: orderHistoryCtrl.appCtrl.appTheme.whiteColor,
                  child: Column(
                    children: [
                      //category layout
                      OrderHistoryWidget().categoryLayout(
                        child: ListView.builder(
                          itemCount: AppArray().daysList.length,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return OrderHistoryWidget().daysListCard(
                                data: AppArray().daysList[index],
                                index: index,
                                selectIndex: orderHistoryCtrl.selectIndex,
                                onTap: () => orderHistoryCtrl.selectCategory(
                                    index, AppArray().daysList[index]['id']),
                                color: orderHistoryCtrl.selectIndex == index
                                    ? orderHistoryCtrl.appCtrl.appTheme.primary
                                    : orderHistoryCtrl
                                        .appCtrl.appTheme.titleColor);
                          },
                        ),
                        context: context,
                        color: orderHistoryCtrl.appCtrl.appTheme.textBoxColor,
                      ),

                      //search product textformfield layout
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppScreenUtil().screenHeight(15),
                            left: AppScreenUtil().screenWidth(15),
                            right: AppScreenUtil().screenWidth(15)),
                        child: Row(
                          children: [
                            Expanded(
                              child: OrderHistoryWidget().textFieldLayout(
                                suffixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          AppScreenUtil().screenHeight(10)),
                                  child: OrderHistoryWidget().voiceIcon(
                                      orderHistoryCtrl
                                          .appCtrl.appTheme.titleColor,
                                      iconAssets.voice),
                                ),
                                prefixIcon: Image.asset(
                                  iconAssets.textboxSearchIcon,
                                  color: orderHistoryCtrl
                                      .appCtrl.appTheme.titleColor,
                                ),
                                text: OrderHistoryFont().searchProduct,
                                borderColor: orderHistoryCtrl
                                    .appCtrl.appTheme.primary
                                    .withOpacity(.3),
                                hintColor: orderHistoryCtrl
                                    .appCtrl.appTheme.contentColor,
                                fillcolor: orderHistoryCtrl
                                    .appCtrl.appTheme.textBoxColor,
                              ),
                            ),
                            const Space(15, 0),
                            InkWell(
                              onTap: () => orderHistoryCtrl.bottomSheet(
                                  context: context,
                                  primaryColor:
                                      orderHistoryCtrl.appCtrl.appTheme.primary,
                                  titleColor: orderHistoryCtrl
                                      .appCtrl.appTheme.titleColor,
                                  termConditionColor: orderHistoryCtrl
                                      .appCtrl.appTheme.darkContentColor,
                                  lightPrimary: orderHistoryCtrl
                                      .appCtrl.appTheme.white
                                      .withOpacity(.3)),
                              child: OrderHistoryFontStyle().mulishtextLayout(
                                  text: OrderHistoryFont().filter,
                                  fontSize: 16,
                                  color:
                                      orderHistoryCtrl.appCtrl.appTheme.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),

                      //order list layout
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().screenHeight(15),
                            horizontal: AppScreenUtil().screenWidth(15)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AppArray().orderHistory.length,
                          itemBuilder: (context, index) {
                            return OrderHistoryCard(
                              onTap: () => Get.toNamed(routeName.addressList),
                              priceTap: () =>
                                  Get.toNamed(routeName.orderDetail),
                              data: AppArray().orderHistory[index],
                              index: index,
                              containerColor: orderHistoryCtrl
                                  .appCtrl.appTheme.wishtListBoxColor,
                              titleColor:
                                  orderHistoryCtrl.appCtrl.appTheme.titleColor,
                              primaryColor:
                                  orderHistoryCtrl.appCtrl.appTheme.primary,
                              dividerColor: orderHistoryCtrl
                                  .appCtrl.appTheme.contentColor,
                              darkContentColor: orderHistoryCtrl
                                  .appCtrl.appTheme.darkContentColor,
                              glowColor:
                                  orderHistoryCtrl.appCtrl.appTheme.primary,
                              unratedColor: orderHistoryCtrl
                                  .appCtrl.appTheme.contentColor,
                              ratingColor:
                                  orderHistoryCtrl.appCtrl.appTheme.ratingColor,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}

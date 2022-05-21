import 'package:fast_ui/controllers/payment_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/payment/card_list_card.dart';
import 'package:fast_ui/views/pages/payment/cash_on_delivery.dart';
import 'package:fast_ui/views/pages/payment/credit_debit_card.dart';
import 'package:fast_ui/views/pages/payment/util/netbanking_list_card.dart';
import 'package:fast_ui/views/pages/payment/util/payment_constants.dart';
import 'package:fast_ui/views/pages/payment/util/payment_fontstyle.dart';
import 'package:fast_ui/views/pages/payment/util/payment_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class PaymentScreen extends StatelessWidget {
  final paymentCtrl = Get.put(PaymentController());

  PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<PaymentController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: paymentCtrl.appCtrl.appTheme.paymentBgColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: PaymentWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: paymentCtrl.appCtrl.appTheme.titleColor,
                  iconColor: paymentCtrl.appCtrl.appTheme.titleColor,
                  image: paymentCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: PaymentWidget().appBarTitleLayout(
                  text: PaymentFont().addPaymentMethod,
                  textColor: paymentCtrl.appCtrl.appTheme.titleColor),
            ),
            backgroundColor: paymentCtrl.appCtrl.appTheme.paymentBgColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: Container(
                color: paymentCtrl.appCtrl.appTheme.paymentBgColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(50)),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                // add address button layout
                                PaymentWidget().addAddressLayout(
                                    onTap: () => paymentCtrl.addCardBottomSheet(
                                        context: context),
                                    context: context,
                                    borderColor: paymentCtrl
                                        .appCtrl.appTheme.contentColor,
                                    color: paymentCtrl
                                        .appCtrl.appTheme.darkContentColor),
                                const Space(0, 20),

                                //select card Layout
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(
                                      paymentCtrl.expand
                                          ? (AppScreenUtil()
                                                      .screenActualWidth() >
                                                  370
                                              ? 350
                                              : 400)
                                          : (AppScreenUtil()
                                                      .screenActualWidth() >
                                                  370
                                              ? 200
                                              : 250)),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            paymentCtrl.expandBox(index),
                                        child:
                                            PaymentWidget().expandableListView(
                                          child: index == 0
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  itemCount: paymentCtrl
                                                      .paymentMethodList[index]
                                                          ['child']
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int indexs) {
                                                    return CardList(
                                                        onTap: () => paymentCtrl
                                                            .selectCard(indexs),
                                                        data: paymentCtrl
                                                                .paymentMethodList[index]
                                                            ['child'][indexs],
                                                        wishtListBoxColor: paymentCtrl
                                                            .appCtrl
                                                            .appTheme
                                                            .wishtListBoxColor,
                                                        selectedIndex: paymentCtrl
                                                            .selectedIndex,
                                                        index: indexs,
                                                        primary: paymentCtrl
                                                            .appCtrl
                                                            .appTheme
                                                            .primary,
                                                        titleColor: paymentCtrl
                                                            .appCtrl
                                                            .appTheme
                                                            .titleColor,
                                                        containerColor:
                                                            paymentCtrl
                                                                .appCtrl
                                                                .appTheme
                                                                .white);
                                                  })
                                              : index == 1
                                                  ? GridView.builder(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              AppScreenUtil()
                                                                  .screenWidth(
                                                                      10)),
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: paymentCtrl
                                                          .paymentMethodList[
                                                              index]['child']
                                                          .length,
                                                      itemBuilder:
                                                          (context, indexs) {
                                                        return NetBankingListCard(
                                                          index: indexs,
                                                          primaryColor:
                                                              paymentCtrl
                                                                  .appCtrl
                                                                  .appTheme
                                                                  .primary,
                                                          selectindex: paymentCtrl
                                                              .netBlankingIndex,
                                                          onTap: () => paymentCtrl
                                                              .selectNetBanking(
                                                                  indexs),
                                                          data: paymentCtrl
                                                                      .paymentMethodList[
                                                                  index]
                                                              ['child'][indexs],
                                                          titleColor:
                                                              paymentCtrl
                                                                  .appCtrl
                                                                  .appTheme
                                                                  .titleColor,
                                                        );
                                                      },
                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 0,
                                                          mainAxisSpacing: 0,
                                                          childAspectRatio: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .width /
                                                              (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  8)),
                                                    )
                                                  : index == 2
                                                      ? GridView.builder(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal:
                                                                  AppScreenUtil()
                                                                      .screenWidth(
                                                                          10)),
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: paymentCtrl
                                                              .paymentMethodList[
                                                                  index]
                                                                  ['child']
                                                              .length,
                                                          itemBuilder: (context,
                                                              indexs) {
                                                            return CreditDebitCard(
                                                              index: indexs,
                                                              primaryColor:
                                                                  paymentCtrl
                                                                      .appCtrl
                                                                      .appTheme
                                                                      .primary,
                                                              selectindex:
                                                                  paymentCtrl
                                                                      .walletIndex,
                                                              onTap: () => paymentCtrl
                                                                  .selectCreditDebit(
                                                                      indexs),
                                                              data: paymentCtrl
                                                                          .paymentMethodList[
                                                                      index][
                                                                  'child'][indexs],
                                                              titleColor:
                                                                  paymentCtrl
                                                                      .appCtrl
                                                                      .appTheme
                                                                      .titleColor,
                                                            );
                                                          },
                                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  0,
                                                              mainAxisSpacing:
                                                                  0,
                                                              childAspectRatio: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      8)),
                                                        )
                                                      : CashOnDeliveryLayout(
                                                          containerColor:
                                                              paymentCtrl
                                                                  .appCtrl
                                                                  .appTheme
                                                                  .wishtListBoxColor,
                                                          primary: paymentCtrl
                                                              .appCtrl
                                                              .appTheme
                                                              .primary,
                                                          titleColor:
                                                              paymentCtrl
                                                                  .appCtrl
                                                                  .appTheme
                                                                  .titleColor,
                                                          wishtListBoxColor:
                                                              paymentCtrl
                                                                  .appCtrl
                                                                  .appTheme
                                                                  .wishtListBoxColor,
                                                          contentColor:
                                                              paymentCtrl
                                                                  .appCtrl
                                                                  .appTheme
                                                                  .titleColor,
                                                        ),
                                          context: context,
                                          lightPrimary: paymentCtrl
                                              .appCtrl.appTheme.iconBgColor,
                                          titleColor: paymentCtrl
                                              .appCtrl.appTheme.titleColor,
                                          onPressed: () =>
                                              paymentCtrl.expandBox(index),
                                          index: index,
                                          title: AppArray()
                                              .paymentMethodList[index]['title']
                                              .toString(),
                                          isExpanded:
                                              index == paymentCtrl.tapped
                                                  ? paymentCtrl.expand
                                                  : false,
                                        ),
                                      );
                                    },
                                    itemCount:
                                        paymentCtrl.paymentMethodList.length,
                                  ),
                                ),
                              ],
                            ),
                            //price detail
                            PaymentWidget().priceDetailLayout(
                              boxColor: paymentCtrl
                                  .appCtrl.appTheme.wishtListBoxColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PaymentFontStyle().mulishtextLayout(
                                      text: PaymentFont().orderDetails,
                                      color: paymentCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontSize: PaymentFontSize.textSizeMedium,
                                      fontWeight: FontWeight.w600),
                                  const Space(0, 15),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().bagTotal,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: PaymentFont().dollar + '220.00',
                                      fontWeight: FontWeight.normal,
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  const Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().bagSavings,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: '-${PaymentFont().dollar}20.00',
                                      fontWeight: FontWeight.normal,
                                      valColor:
                                          paymentCtrl.appCtrl.appTheme.primary),
                                  const Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().couponDiscount,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      val: 'Apply Coupon',
                                      fontWeight: FontWeight.normal,
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.redColor),
                                  const Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().delivery,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor,
                                      fontWeight: FontWeight.normal,
                                      val: PaymentFont().dollar + '50.00',
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.darkContentColor),
                                  const Space(0, 10),
                                  const Divider(),
                                  const Space(0, 10),
                                  PaymentWidget().commonPriceDetail(
                                      title: PaymentFont().totalAmount,
                                      titleColor: paymentCtrl
                                          .appCtrl.appTheme.titleColor,
                                      fontWeight: FontWeight.w600,
                                      val: PaymentFont().dollar + '270.00',
                                      valColor: paymentCtrl
                                          .appCtrl.appTheme.titleColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //confirm payment layout
                    PaymentWidget().proceedPaymentButtonLayout(
                        context: context,
                        onTap: () => Get.toNamed(routeName.orderSuccess),
                        buttonColor: paymentCtrl.appCtrl.appTheme.primary,
                        itemColor: paymentCtrl.appCtrl.appTheme.white)
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

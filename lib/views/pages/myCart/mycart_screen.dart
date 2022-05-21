import 'package:fast_ui/controllers/mycart_controller.dart';
import 'package:fast_ui/views/pages/myCart/mycart_card.dart';
import 'package:fast_ui/views/pages/myCart/offer_ui_card.dart';
import 'package:fast_ui/views/pages/myCart/util/mycart_fontstyle.dart';
import 'package:fast_ui/views/pages/myCart/util/mycart_widget.dart';
import 'package:fast_ui/views/pages/myCart/util/mycart_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class MyCartListScreen extends StatefulWidget {
  const MyCartListScreen({Key? key}) : super(key: key);

  @override
  State<MyCartListScreen> createState() => _MyCartListScreenState();
}

class _MyCartListScreenState extends State<MyCartListScreen> {
  var wishListCtrl = Get.put(MyCartListController());

  void doNothing(BuildContext context) {}

  @override
  void initState() {
    // TODO: implement initState
    wishListCtrl.isAppBar = Get.arguments ?? false;
    wishListCtrl.update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<MyCartListController>(builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (wishListCtrl.isAppBar == true) {
              Get.back();
            }
            return Future(() => wishListCtrl.isAppBar ? true : false);
          },
          child: AppComponent(
            child: Scaffold(
              appBar: wishListCtrl.isAppBar
                  ? MyCartWidget().appBarLayout(
                      backgroundColor: wishListCtrl.appCtrl.appTheme.blackColor,
                      actionOnTap: () => wishListCtrl.goToHome(),
                      onTap: () async {
                        if (wishListCtrl.isAppBar) {
                          Get.back();
                        } else {
                          await wishListCtrl.appCtrl.getStorage
                              .write('selectedIndex', 0);
                          wishListCtrl.appCtrl.selectedIndex = 0;
                          wishListCtrl.appCtrl.update();
                        }
                      },
                      titleColor: wishListCtrl.appCtrl.appTheme.titleColor,
                      image: wishListCtrl.appCtrl.isTheme
                          ? imageAssets.themeFkLogo
                          : imageAssets.fkLogo,
                      darkContentColor:
                          wishListCtrl.appCtrl.appTheme.darkContentColor)
                  : PreferredSize(
                      preferredSize: Size.fromHeight(AppScreenUtil()
                          .screenHeight(
                              AppScreenUtil().screenActualWidth() > 370
                                  ? 65
                                  : 70)),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height /
                              AppScreenUtil().screenHeight(18),
                        ),
                        child: MyCartWidget().appBarLayout(
                            actionOnTap: () => wishListCtrl.goToHome(),
                            backgroundColor:
                                wishListCtrl.appCtrl.appTheme.blackColor,
                            onTap: () async {
                              if (wishListCtrl.isAppBar) {
                                Get.back();
                              } else {
                                await wishListCtrl.appCtrl.getStorage
                                    .write('selectedIndex', 0);
                                wishListCtrl.appCtrl.selectedIndex = 0;
                                wishListCtrl.appCtrl.update();
                              }
                            },
                            titleColor:
                                wishListCtrl.appCtrl.appTheme.titleColor,
                            image: wishListCtrl.appCtrl.isTheme
                                ? imageAssets.themeFkLogo
                                : imageAssets.fkLogo,
                            darkContentColor:
                                wishListCtrl.appCtrl.appTheme.darkContentColor),
                      ),
                    ),
              backgroundColor: wishListCtrl.appCtrl.appTheme.blackColor,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: Container(
                  margin:
                      EdgeInsets.only(bottom: AppScreenUtil().screenHeight(10)),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: AppScreenUtil().screenHeight(50)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // wish list layout
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    left: AppScreenUtil().screenHeight(15),
                                    right: AppScreenUtil().screenHeight(15)),
                                child: ListView.builder(
                                  itemCount: wishListCtrl.offerList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Slidable(
                                      endActionPane: ActionPane(
                                        extentRatio: 0.32,
                                        motion: const ScrollMotion(),
                                        children: [
                                          Container(
                                            width: AppScreenUtil()
                                                .screenWidth(100),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: wishListCtrl
                                                  .appCtrl.appTheme.primary,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      AppScreenUtil()
                                                          .borderRadius(10)),
                                                  bottomRight: Radius.circular(
                                                      AppScreenUtil()
                                                          .borderRadius(10))),
                                            ),
                                            margin: EdgeInsets.symmetric(
                                              vertical: AppScreenUtil()
                                                  .screenHeight(10),
                                            ),
                                            child: GestureDetector(
                                              onTap: () => {},
                                              child: Image.asset(
                                                iconAssets.delete,
                                                height: AppScreenUtil()
                                                    .screenHeight(20),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      // The child of the Slidable is what the user sees when the
                                      // component is not dragged.
                                      child: MyCartCard(
                                        onTap: () => Get.toNamed(
                                            routeName.productDetail),
                                        data: wishListCtrl.offerList[index],
                                        containerboxColor: wishListCtrl
                                            .appCtrl.appTheme.wishtListBoxColor,
                                        descriptionColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        discountBoxColor: wishListCtrl
                                            .appCtrl.appTheme.primary,
                                        discountTextColor: wishListCtrl
                                            .appCtrl.appTheme.whiteColor,
                                        dividerColor: wishListCtrl
                                            .appCtrl.appTheme.contentColor
                                            .withOpacity(.5),
                                        quantityBorderColor: wishListCtrl
                                            .appCtrl.appTheme.lightPrimary,
                                        titleColor: wishListCtrl
                                            .appCtrl.appTheme.titleColor,
                                        plusTap: () =>
                                            wishListCtrl.plusTap(index),
                                        minusTap: () =>
                                            wishListCtrl.minusTap(index),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              //offer ui card
                              OfferUICard(
                                onTap: () => wishListCtrl.bottomSheet(
                                    context: context,
                                    primaryColor:
                                        wishListCtrl.appCtrl.appTheme.primary,
                                    whiteColor:
                                        wishListCtrl.appCtrl.appTheme.white,
                                    termConditionColor: wishListCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    lightPrimary: wishListCtrl
                                        .appCtrl.appTheme.white
                                        .withOpacity(.3)),
                                isTheme: wishListCtrl.appCtrl.isTheme,
                                discountColor:
                                    wishListCtrl.appCtrl.appTheme.primary,
                                titleColor:
                                    wishListCtrl.appCtrl.appTheme.titleColor,
                                darkContentColor: wishListCtrl
                                    .appCtrl.appTheme.darkContentColor,
                                whiteColor:
                                    wishListCtrl.appCtrl.appTheme.whiteColor,
                              ),
                              const Space(0, 5),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: AppScreenUtil().screenHeight(20)),
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppScreenUtil().screenWidth(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyCartFontStyle().mulishtextLayout(
                                        text: MyCartFont().orderDetails,
                                        color: wishListCtrl
                                            .appCtrl.appTheme.titleColor,
                                        fontSize: MyCartFontSize.textSizeMedium,
                                        fontWeight: FontWeight.w600),
                                    const Space(0, 15),
                                    MyCartWidget().commonPriceDetail(
                                        title: MyCartFont().bagTotal,
                                        titleColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        val: MyCartFont().dollar + '220.00',
                                        fontWeight: FontWeight.normal,
                                        valColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor),
                                    const Space(0, 10),
                                    MyCartWidget().commonPriceDetail(
                                        title: MyCartFont().bagSavings,
                                        titleColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        val: '-${MyCartFont().dollar}20.00',
                                        fontWeight: FontWeight.normal,
                                        valColor: wishListCtrl
                                            .appCtrl.appTheme.primary),
                                    const Space(0, 10),
                                    MyCartWidget().commonPriceDetail(
                                        title: MyCartFont().couponDiscount,
                                        titleColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        val: 'Apply Coupon',
                                        fontWeight: FontWeight.normal,
                                        valColor: wishListCtrl
                                            .appCtrl.appTheme.redColor),
                                    const Space(0, 10),
                                    MyCartWidget().commonPriceDetail(
                                        title: MyCartFont().delivery,
                                        titleColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor,
                                        fontWeight: FontWeight.normal,
                                        val: MyCartFont().dollar + '50.00',
                                        valColor: wishListCtrl
                                            .appCtrl.appTheme.darkContentColor),
                                    const Space(0, 10),
                                    const Divider(),
                                    const Space(0, 10),
                                    MyCartWidget().commonPriceDetail(
                                        title: MyCartFont().totalAmount,
                                        titleColor: wishListCtrl
                                            .appCtrl.appTheme.titleColor,
                                        fontWeight: FontWeight.w600,
                                        val: MyCartFont().dollar + '270.00',
                                        valColor: wishListCtrl
                                            .appCtrl.appTheme.titleColor),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // process to Checkout button
                      MyCartWidget().proceedToCheckout(
                          containerColor: wishListCtrl.appCtrl.appTheme.primary,
                          textColor: wishListCtrl.appCtrl.appTheme.white,
                          context: context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

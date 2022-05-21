import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';
import '../utilities/app_array.dart';
import '../views/pages/offers/util/offer_constants.dart';
import '../views/pages/offers/util/offer_fontstyle.dart';
import '../views/pages/offers/util/offer_widget.dart';

class OfferController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int itemfilterIndex = 0;
  //offer detail bottom sheet
  bottomSheet(
      {var primaryColor,
      data,
      var whiteColor,
      var lightPrimary,
      var termConditionColor,
      context}) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
            ),
            height: AppScreenUtil().screenHeight(500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfferWidget().bottomSheetLayout(
                    primaryColor: primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OfferFontStyle().quicksandtextLayout(
                            text: "Flat ${data['discount']}% off",
                            color: whiteColor,
                            fontSize: OfferFontSize.textSizeNormal,
                            fontWeight: FontWeight.bold),
                        const Space(0, 10),
                        OfferFontStyle().quicksandtextLayout(
                            text: data['des'],
                            color: whiteColor,
                            fontSize: OfferFontSize.textSizeSMedium,
                            fontWeight: FontWeight.normal),
                        const Space(0, 10),
                        OfferWidget().codeLayout(
                            lightPrimary: lightPrimary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    OfferFontStyle().mulishtextLayout(
                                        text: "Code:",
                                        color: whiteColor,
                                        fontSize: OfferFontSize.textSizeSMedium,
                                        fontWeight: FontWeight.normal),
                                    const Space(5, 0),
                                    OfferFontStyle().mulishtextLayout(
                                        text: data['code'],
                                        color: whiteColor,
                                        fontSize: OfferFontSize.textSizeSMedium,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                OfferWidget().copyCodeButton(
                                    text: OfferFont().copyCode,
                                    whiteColor: whiteColor,
                                    primaryColor: primaryColor)
                              ],
                            ))
                      ],
                    )),
                const Space(0, 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: OfferFontStyle().mulishtextLayout(
                      text: OfferFont().termsConditions,
                      color: termConditionColor,
                      fontSize: OfferFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600),
                ),
                const Space(0, 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: OfferFontStyle().mulishtextLayout(
                      text:
                          "1. Information on how to participate forms part of these Terms & Conditions. By participating, claimants agree to be bound by these Terms & Conditions. Claimants must comply with these Terms & Conditions for a coupon to be valid.",
                      color: termConditionColor,
                      fontSize: OfferFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal),
                ),
                const Space(0, 20),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: OfferFontStyle().mulishtextLayout(
                      text:
                          "2. Each claimant is entitled to one coupon per accommodation establishment. Coupons are not transferable and are not redeemable for cash and cannot be combined with any other coupons or any other offer or discounts or promotions offered ",
                      color: termConditionColor,
                      fontSize: OfferFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ));
      },
    );
  }

  //bottom sheet for filter
  filterbottomSheet({
    context,
  }) {
    showModalBottomSheet<void>(
      backgroundColor: appCtrl.appTheme.popUpColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
      // context and builder are
      // required properties in this widget
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return GetBuilder<OfferController>(builder: (_) {
          return OfferWidget().popLayout(
              context: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OfferFontStyle().mulishtextLayout(
                      text: OfferFont().filter,
                      fontSize: OfferFontSize.textSizeMedium,
                      color: appCtrl.appTheme.titleColor),
                  const Space(0, 20),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AppArray().shopFilterList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          itemfilterIndex = index;
                          update();
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == itemfilterIndex
                                ? appCtrl.appTheme.primary
                                : appCtrl.appTheme.wishtListBoxColor,
                            borderRadius: BorderRadius.circular(
                                AppScreenUtil().borderRadius(5)),
                            border: Border.all(
                                color: appCtrl.isTheme
                                    ? appCtrl.appTheme.gray
                                    : appCtrl.appTheme.primary.withOpacity(.2),
                                width: .5), //border of dropdown button
                          ),
                          child: OfferFontStyle().mulishtextLayout(
                              text: AppArray()
                                  .shopFilterList[index]['title']
                                  .toString(),
                              fontSize: OfferFontSize.textSizeSMedium,
                              color: index == itemfilterIndex
                                  ? appCtrl.appTheme.white
                                  : appCtrl.appTheme.darkContentColor),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 7),
                    ),
                  ),
                  const Space(0, 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OfferWidget().commonButtonWidget(
                          containerColor: appCtrl.appTheme.popUpColor,
                          context: context,
                          borderColor: appCtrl.appTheme.primary,
                          textColor: appCtrl.appTheme.primary,
                          text: OfferFont().close),
                      OfferWidget().commonButtonWidget(
                          containerColor: appCtrl.appTheme.primary,
                          context: context,
                          borderColor: appCtrl.appTheme.primary,
                          textColor: appCtrl.appTheme.whiteColor,
                          text: OfferFont().apply),
                    ],
                  )
                ],
              ));
        });
      },
    );
  }
}

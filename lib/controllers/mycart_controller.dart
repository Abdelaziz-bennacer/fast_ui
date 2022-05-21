import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../utilities/app_array.dart';
import '../views/pages/myCart/util/mycart_constants.dart';
import '../views/pages/myCart/util/mycart_fontstyle.dart';
import '../views/pages/myCart/util/mycart_widget.dart';

class MyCartListController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final getStorage = GetStorage();
  List offerList = [];
  bool isAppBar = false;

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //quantity increment function
  plusTap(index) {
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //quantity decrement function
  minusTap(index) {
    if (offerList[index]['quantity'] != 0) {
      if (offerList[index]['quantity'] == "0") {
        offerList[index]['quantity'] = "0";
        update();
      } else {
        int count = int.parse(offerList[index]['quantity'].toString());
        count = count - 1;
        offerList[index]['quantity'] = count.toString();
        update();
      }
    }
  }

//get data
  getData() {
    offerList = AppArray().offerList;
    update();
    appCtrl.hideLoading();
    update();
  }

  //offer detail bottom sheet
  bottomSheet(
      {var primaryColor,
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
                MyCartWidget().bottomSheetLayout(
                    primaryColor: primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCartFontStyle().quicksandtextLayout(
                            text:
                                "Flat ${AppArray().myOfferList[0]['discount']}% off",
                            color: whiteColor,
                            fontSize: MyCartFontSize.textSizeNormal,
                            fontWeight: FontWeight.bold),
                        const Space(0, 10),
                        MyCartFontStyle().quicksandtextLayout(
                            text: AppArray().myOfferList[0]['des'].toString(),
                            color: whiteColor,
                            fontSize: MyCartFontSize.textSizeSMedium,
                            fontWeight: FontWeight.normal),
                        const Space(0, 10),
                        MyCartWidget().codeLayout(
                            lightPrimary: lightPrimary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    MyCartFontStyle().mulishtextLayout(
                                        text: "Code:",
                                        color: whiteColor,
                                        fontSize:
                                            MyCartFontSize.textSizeSMedium,
                                        fontWeight: FontWeight.normal),
                                    const Space(5, 0),
                                    MyCartFontStyle().mulishtextLayout(
                                        text: AppArray()
                                            .myOfferList[0]['code']
                                            .toString(),
                                        color: whiteColor,
                                        fontSize:
                                            MyCartFontSize.textSizeSMedium,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                MyCartWidget().copyCodeButton(
                                    text: MyCartFont().copyCode,
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
                  child: MyCartFontStyle().mulishtextLayout(
                      text: MyCartFont().termsConditions,
                      color: termConditionColor,
                      fontSize: MyCartFontSize.textSizeSMedium,
                      fontWeight: FontWeight.w600),
                ),
                const Space(0, 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: MyCartFontStyle().mulishtextLayout(
                      text:
                          "1. Information on how to participate forms part of these Terms & Conditions. By participating, claimants agree to be bound by these Terms & Conditions. Claimants must comply with these Terms & Conditions for a coupon to be valid.",
                      color: termConditionColor,
                      fontSize: MyCartFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal),
                ),
                const Space(0, 20),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20)),
                  child: MyCartFontStyle().mulishtextLayout(
                      text:
                          "2. Each claimant is entitled to one coupon per accommodation establishment. Coupons are not transferable and are not redeemable for cash and cannot be combined with any other coupons or any other offer or discounts or promotions offered ",
                      color: termConditionColor,
                      fontSize: MyCartFontSize.textSizeSmall,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ));
      },
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.showLoading();
    appCtrl.update();
    getData();
    super.onReady();
  }
}

import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';

import '../utilities/app_array.dart';
import '../views/pages/payment/add_card_layout.dart';

class PaymentController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  bool expand = false;
  int? tapped = 0;
  int selectedIndex = 0;
  int netBlankingIndex = 0;
  int walletIndex = 0;
  bool isShow = false;
  bool isShowNetBanking = false;
  bool isShowWallet = false;
  bool isShowCash = false;
  var key = -1;
  List cardList = [];
  List paymentMethodList = [];
  List netBankingList = [];
  List creditDebitCardList = [];

  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtExpiryDate = TextEditingController();
  TextEditingController txtCVe = TextEditingController();

  //select Card
  selectCard(index) {
    selectedIndex = index;
    update();
  }

  //select Address
  selectNetBanking(index) {
    netBlankingIndex = index;
    update();
  }

  //select credit-debit
  selectCreditDebit(index) {
    walletIndex = index;
    update();
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;

    tapped = index;
    update();
  }

  addCardBottomSheet({
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
        return GetBuilder<PaymentController>(builder: (_) {
          return AddCardLayout(
            txtName: txtName,
            txtExpiryDate: txtExpiryDate,
            txtCV: txtCVe,
            txtnumber: txtNumber,
            primaryColor: appCtrl.appTheme.primary,
            textColor: appCtrl.appTheme.titleColor,
            hintColor: appCtrl.appTheme.contentColor,
            fillcolor: appCtrl.appTheme.textBoxColor,
            cancelTextColor: appCtrl.appTheme.white,
            closeContainerColor: appCtrl.appTheme.whiteColor,
            closeTap: () => Get.back(),
            applyTap: () => Get.back(),
          );
        });
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tapped = 0;
    expand = true;
    paymentMethodList = AppArray().paymentMethodList;
    update();
    super.onInit();
  }
}

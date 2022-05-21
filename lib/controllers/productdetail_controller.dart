import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';
import '../utilities/app_array.dart';
import '../views/pages/productDetail/content_bottom_sheet.dart';
import '../views/pages/productDetail/review_card.dart';
import '../views/pages/productDetail/util/product_detail_constants.dart';
import '../views/pages/productDetail/util/product_detail_fontstyle.dart';

class ProductDetailController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  int quantityIndex = 0;
  int quantity = 0;
  bool expand = false;
  int? tapped = 0;
  List detailList = [];
  List reviewList = [];
  List detail = [];
  int deliveryIndex = 0;
  double rating = 2.5;
  bool isShow = false;
  String selectedQuantity = AppArray().quantityList[0]['title'].toString();
  String selectedDeliveryTime =
      AppArray().deliveryTimeList[0]['title'].toString();

  //increase quantity
  increaseQuantity() {
    quantity++;
    update();
  }

  //decrease quantity
  decreaseQuantity() {
    if (quantity != 0) {
      quantity--;
      update();
    } else {
      quantity = 0;
      update();
    }
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;

    tapped = index;
    update();
  }

  //quantity select bottom sheet
  quantityBottomSheet({
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
        return GetBuilder<ProductDetailController>(builder: (_) {
          return QuantityBottomSheet(
            data: AppArray().quantityList,
            primaryColor: appCtrl.appTheme.primary,
            borderColor: appCtrl.appTheme.contentColor.withOpacity(.5),
            textColor: appCtrl.appTheme.titleColor,
            containerColor: appCtrl.appTheme.wishtListBoxColor,
            iconColor: appCtrl.appTheme.white,
            cancelTextColor: appCtrl.appTheme.white,
            closeContainerColor: appCtrl.appTheme.whiteColor,
            closeTap: () => Get.back(),
            applyTap: () => Get.back(),
            isQuantity: true,
          );
        });
      },
    );
  }

  //delivery time select bottom sheet
  deliveryBottomSheet({
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
        return GetBuilder<ProductDetailController>(builder: (_) {
          return QuantityBottomSheet(
            primaryColor: appCtrl.appTheme.primary,
            borderColor: appCtrl.appTheme.contentColor.withOpacity(.5),
            textColor: appCtrl.appTheme.titleColor,
            containerColor: appCtrl.appTheme.wishtListBoxColor,
            iconColor: appCtrl.appTheme.white,
            cancelTextColor: appCtrl.appTheme.white,
            closeContainerColor: appCtrl.appTheme.whiteColor,
            data: AppArray().deliveryTimeList,
            closeTap: () => Get.back(),
            applyTap: () => Get.back(),
            isQuantity: false,
          );
        });
      },
    );
  }

  //review list
  //delivery time select bottom sheet
  reviewListBottomSheet({
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
        return GetBuilder<ProductDetailController>(builder: (_) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
            ),
            height: MediaQuery.of(context).size.height /
                AppScreenUtil().screenHeight(1.5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailFontStyle().mulishtextLayout(
                      text: ProductDetailFont().selectQuantity,
                      fontWeight: FontWeight.w600,
                      fontSize: ProductDetailFontSize.textSizeSMedium,
                      color: appCtrl.appTheme.titleColor),
                  const Space(0, 10),
                  ListView.builder(
                    itemCount: reviewList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ReviewCard(
                        data: reviewList[index],
                        glowColor: appCtrl.appTheme.primary,
                        unratedColor: appCtrl.appTheme.contentColor,
                        ratingColor: appCtrl.appTheme.ratingColor,
                        color: appCtrl.appTheme.wishtListBoxColor,
                        descColor: appCtrl.appTheme.darkContentColor,
                        nameColor: appCtrl.appTheme.titleColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    detailList = AppArray().detailList;
    reviewList = AppArray().reviewList;
    detail = AppArray().productDetailList;
    update();
  }
}

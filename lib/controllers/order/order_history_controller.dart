import 'package:fast_ui/config.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_constants.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_fontstyle.dart';
import 'package:fast_ui/views/orderPages/orderHistory/util/order_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class OrderHistoryController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final getStorage = GetStorage();

  int selectIndex = 0;
  int filterIndex = 0;

  int itemfilterIndex = 0;

  List filterList = [];

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  //select category function
  selectCategory(index, id) {
    appCtrl.showLoading();
    selectIndex = index;
    appCtrl.hideLoading();
    update();
  }

  //bottom sheet for filter
  bottomSheet(
      {var primaryColor,
      var titleColor,
      var lightPrimary,
      var termConditionColor,
      context,
      String? dropDownValue}) {
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
        return GetBuilder<OrderHistoryController>(builder: (_) {
          return OrderHistoryWidget().popLayout(
              context: context,
              primaryColor: primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderHistoryFontStyle().mulishtextLayout(
                      text: OrderHistoryFont().filter,
                      fontSize: OrderHistoryFontSize.textSizeMedium,
                      color: titleColor),
                  const Space(0, 20),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AppArray().filterList.length,
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
                          child: OrderHistoryFontStyle().mulishtextLayout(
                              text: AppArray()
                                  .filterList[index]['title']
                                  .toString(),
                              fontSize: OrderHistoryFontSize.textSizeSMedium,
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
                  OrderHistoryFontStyle().mulishtextLayout(
                      text: OrderHistoryFont().timefilter,
                      fontSize: OrderHistoryFontSize.textSizeMedium,
                      color: titleColor),
                  const Space(0, 20),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AppArray().timefilterList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          filterIndex = index;
                          update();
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == filterIndex
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
                          child: OrderHistoryFontStyle().mulishtextLayout(
                              text: AppArray()
                                  .timefilterList[index]['title']
                                  .toString(),
                              fontSize: OrderHistoryFontSize.textSizeSMedium,
                              color: index == filterIndex
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
                  const Space(0, 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrderHistoryWidget().commonButtonWidget(
                          containerColor: appCtrl.appTheme.popUpColor,
                          context: context,
                          borderColor: appCtrl.appTheme.primary,
                          textColor: appCtrl.appTheme.primary,
                          text: OrderHistoryFont().close),
                      OrderHistoryWidget().commonButtonWidget(
                          containerColor: appCtrl.appTheme.primary,
                          context: context,
                          borderColor: appCtrl.appTheme.primary,
                          textColor: appCtrl.appTheme.whiteColor,
                          text: OrderHistoryFont().apply),
                    ],
                  )
                ],
              ));
        });
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit

    update();
    super.onInit();
  }
}

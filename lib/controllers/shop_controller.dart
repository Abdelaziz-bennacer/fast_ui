import 'package:fast_ui/config.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/shop/util/shop_constants.dart';
import 'package:fast_ui/views/pages/shop/util/shop_fontstyle.dart';
import 'package:fast_ui/views/pages/shop/util/shop_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int selectIndex = 0;
  int itemfilterIndex = 0;
  List offerList = [];
  String dropDownval = "Fresh Fruits& Vegetables";
  int packSizeIndex = 0;
  RangeValues _currentRangeValues = const RangeValues(0, 100);

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

  //get shop data
  getData() {
    appCtrl.showLoading();
    appCtrl.update();
    offerList = AppArray().shopList;
    update();
    appCtrl.hideLoading();
    // selectCategory(1);
  }

  //select category function
  selectCategory(index, id) {
    appCtrl.showLoading();
    selectIndex = index;
    appCtrl.hideLoading();
    update();
  }

  bottomSheet(
      {var primaryColor,
      var categoryTextColor,
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
        return GetBuilder<ShopController>(builder: (_) {
          return ShopWidget().popLayout(
              context: context,
              primaryColor: primaryColor,
              categoryTextColor: categoryTextColor,
              child: ShopWidget().decoratedBoxLayout(
                  wishtListBoxColor: appCtrl.appTheme.wishtListBoxColor,
                  borderColor: appCtrl.appTheme.borderColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(25)),
                      child: DropdownButton(
                        value: dropDownval,
                        items: const [
                          //add items in the dropdown
                          DropdownMenuItem(
                            child: Text("Fresh Fruits& Vegetables"),
                            value: "Fresh Fruits& Vegetables",
                          ),
                          DropdownMenuItem(
                              child: Text("Oils,Refined & Ghee"),
                              value: "Oils,Refined & Ghee"),
                          DropdownMenuItem(
                            child: Text("Rice, Flour & Gains"),
                            value: "Rice, Flour & Gains",
                          ),
                          DropdownMenuItem(
                            child: Text("Food Cupboard"),
                            value: "Food Cupboard",
                          ),
                          DropdownMenuItem(
                            child: Text("Drink& Beverages"),
                            value: "Drink& Beverages",
                          ),
                          DropdownMenuItem(
                            child: Text("Instant Mixes"),
                            value: "Instant Mixes",
                          )
                        ],
                        onChanged: (value) {
                          //get value when changed
                          dropDownval = value.toString();
                          update();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: appCtrl.appTheme.titleColor,
                        ),
                        //Icon color
                        style: TextStyle(
                            //te
                            color: appCtrl.appTheme.titleColor, //Font color
                            fontFamily: GoogleFonts.mulish().fontFamily,
                            fontSize: AppScreenUtil().fontSize(ShopFontSize
                                .textSizeSMedium) //font size on dropdown button
                            ),
                        underline: Container(),
                        //remove underline
                        isExpanded: true, //make true to make width 100%
                      ))),
              packageSize: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppArray().packageSizeList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      packSizeIndex = index;
                      update();
                    },
                    child: Container(
                      height: AppScreenUtil().screenHeight(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == packSizeIndex
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
                      child: ShopFontStyle().mulishtextLayout(
                          text: AppArray()
                              .packageSizeList[index]['title']
                              .toString(),
                          fontSize: ShopFontSize.textSizeSMedium,
                          color: index == packSizeIndex
                              ? appCtrl.appTheme.white
                              : appCtrl.appTheme.darkContentColor),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 7)),
              ),
              rangeSlider: Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: appCtrl.appTheme.primary,
                      inactiveTrackColor: appCtrl.appTheme.wishtListBoxColor,
                      thumbColor: appCtrl.appTheme.primary,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 6),
                    ),
                    child: RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        _currentRangeValues = values;
                        update();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShopWidget().rangeValue(
                          text: _currentRangeValues.start.round().toString(),
                          containerColor: appCtrl.isTheme
                              ? appCtrl.appTheme.primary
                              : appCtrl.appTheme.wishtListBoxColor,
                          borderColor: appCtrl.isTheme
                              ? appCtrl.appTheme.gray
                              : appCtrl.appTheme.primary.withOpacity(.2),
                          textColor: appCtrl.appTheme.titleColor),
                      ShopWidget().rangeValue(
                          text: _currentRangeValues.end.round().toString(),
                          containerColor: appCtrl.isTheme
                              ? appCtrl.appTheme.primary
                              : appCtrl.appTheme.wishtListBoxColor,
                          borderColor: appCtrl.isTheme
                              ? appCtrl.appTheme.gray
                              : appCtrl.appTheme.primary.withOpacity(.2),
                          textColor: appCtrl.appTheme.titleColor),
                    ],
                  )
                ],
              ),
              buttonLayout: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShopWidget().commonButtonWidget(
                      containerColor: appCtrl.appTheme.popUpColor,
                      context: context,
                      borderColor: appCtrl.appTheme.primary,
                      textColor: appCtrl.appTheme.primary,
                      text: ShopFont().close),
                  ShopWidget().commonButtonWidget(
                      containerColor: appCtrl.appTheme.primary,
                      context: context,
                      borderColor: appCtrl.appTheme.primary,
                      textColor: appCtrl.appTheme.whiteColor,
                      text: ShopFont().cancel),
                ],
              ));
        });
      },
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady

    getData();
    super.onReady();
  }
}

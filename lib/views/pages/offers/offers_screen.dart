import 'package:fast_ui/controllers/offer_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/offers/offer_list_card.dart';
import 'package:fast_ui/views/pages/offers/util/offer_constants.dart';
import 'package:fast_ui/views/pages/offers/util/offer_fontstyle.dart';
import 'package:fast_ui/views/pages/offers/util/offer_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  var offerCtrl = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return GetBuilder<OfferController>(builder: (_) {
        return Scaffold(
          backgroundColor: offerCtrl.appCtrl.appTheme.blackColor,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //search product textformfield layout
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppScreenUtil().screenHeight(15),
                              right: AppScreenUtil().screenHeight(15)),
                          child: Row(
                            children: [
                              Expanded(
                                child: OfferWidget().textFieldLayout(
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppScreenUtil().screenHeight(
                                            AppScreenUtil()
                                                        .screenActualWidth() >
                                                    370
                                                ? 10
                                                : 15)),
                                    child: Image.asset(
                                      iconAssets.voice,
                                      fit: BoxFit.contain,
                                      color:
                                          offerCtrl.appCtrl.appTheme.titleColor,
                                      height: AppScreenUtil().screenHeight(10),
                                      width: AppScreenUtil().screenWidth(10),
                                    ),
                                  ),
                                  prefixIcon: Image.asset(
                                    iconAssets.textboxSearchIcon,
                                    color:
                                        offerCtrl.appCtrl.appTheme.titleColor,
                                  ),
                                  text: OfferFont().searchProduct,
                                  borderColor: offerCtrl
                                      .appCtrl.appTheme.primary
                                      .withOpacity(.3),
                                  hintColor:
                                      offerCtrl.appCtrl.appTheme.contentColor,
                                  fillcolor:
                                      offerCtrl.appCtrl.appTheme.textBoxColor,
                                ),
                              ),
                              const Space(15, 0),
                              InkWell(
                                onTap: () => offerCtrl.filterbottomSheet(
                                    context: context),
                                child: OfferFontStyle().mulishtextLayout(
                                    text: OfferFont().filter,
                                    fontSize: 16,
                                    color: offerCtrl.appCtrl.appTheme.primary,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),

                        const Space(0, 20),

                        Container(
                          margin: EdgeInsets.only(
                              left: AppScreenUtil().screenHeight(15),
                              right: AppScreenUtil().screenHeight(15)),
                          child: ListView.builder(
                            itemCount: AppArray().myOfferList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OfferListCard(
                                isTheme: offerCtrl.appCtrl.isTheme,
                                onTap: () => offerCtrl.bottomSheet(
                                    context: context,
                                    primaryColor:
                                        offerCtrl.appCtrl.appTheme.primary,
                                    data: AppArray().myOfferList[index],
                                    whiteColor:
                                        offerCtrl.appCtrl.appTheme.white,
                                    termConditionColor: offerCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    lightPrimary: offerCtrl
                                        .appCtrl.appTheme.white
                                        .withOpacity(.3)),
                                data: AppArray().myOfferList[index],
                                primaryColor:
                                    offerCtrl.appCtrl.appTheme.primary,
                                titleColor:
                                    offerCtrl.appCtrl.appTheme.titleColor,
                                darkContentColor:
                                    offerCtrl.appCtrl.appTheme.darkContentColor,
                                whiteColor:
                                    offerCtrl.appCtrl.appTheme.whiteColor,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}

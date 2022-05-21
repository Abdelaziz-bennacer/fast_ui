import 'package:fast_ui/controllers/search_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/search/trending_product_card.dart';
import 'package:fast_ui/views/pages/search/util/search_constants.dart';
import 'package:fast_ui/views/pages/search/util/search_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  var searchCtrl = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (_) {
      return Scaffold(
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
                        child: SearchWidget().textFieldLayout(
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppScreenUtil().screenHeight(
                                    AppScreenUtil().screenActualWidth() > 370
                                        ? 10
                                        : 15)),
                            child: Image.asset(
                              iconAssets.voice,
                              fit: BoxFit.contain,
                              color: appCtrl.appTheme.titleColor,
                              height: AppScreenUtil().screenHeight(10),
                              width: AppScreenUtil().screenWidth(10),
                            ),
                          ),
                          prefixIcon: Image.asset(
                            iconAssets.textboxSearchIcon,
                            color: appCtrl.appTheme.titleColor,
                          ),
                          text: SearchFont().searchProduct,
                          borderColor: appCtrl.appTheme.primary.withOpacity(.3),
                          hintColor: appCtrl.appTheme.contentColor,
                          fillcolor: appCtrl.appTheme.textBoxColor,
                        ),
                      ),
                      const Space(0, 20),

                      //recent search text layout
                      SearchWidget().recentSearchText(
                          text: SearchFont().recentlySearch,
                          color: appCtrl.appTheme.titleColor),

                      //recent search list layout
                      SearchWidget().recentSearchLayout(
                          ListView.builder(
                            itemCount: AppArray().recentSearch.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SearchWidget().recentListCard(
                                data: AppArray().recentSearch[index],
                                color: appCtrl.appTheme.arrowSelectColor,
                              );
                            },
                          ),
                          context),
                      const Space(0, 20),

                      //trending category text layout
                      SearchWidget().trendingCategoryText(
                          text: SearchFont().trendingCategory,
                          color: appCtrl.appTheme.titleColor),

                      //recent search list layout
                      SearchWidget().trendingCategoryLayout(ListView.builder(
                        itemCount: AppArray().categoryData.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SearchWidget().trendingProductCard(
                              onTap: () => Get.toNamed(routeName.shopScreen),
                              data: AppArray().categoryData[index]);
                        },
                      )),
                      const Space(0, 20),

                      //trending product text layout
                      SearchWidget().trendingProductText(
                          text: SearchFont().trendingProducts,
                          color: appCtrl.appTheme.titleColor),
                      const Space(0, 15),

                      //trending product list
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: appCtrl.appTheme.offerBoxColor,
                        padding: EdgeInsets.only(
                            top: AppScreenUtil().screenHeight(10),
                            left: AppScreenUtil().screenHeight(15),
                            right: AppScreenUtil().screenHeight(15)),
                        child: ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Get.toNamed(routeName.productDetail),
                              child: TrendingProductCard(
                                data: searchCtrl.offerList[index],
                                containerboxColor: appCtrl.appTheme.whiteColor,
                                descriptionColor:
                                    appCtrl.appTheme.darkContentColor,
                                discountBoxColor: appCtrl.appTheme.primary,
                                discountTextColor: appCtrl.appTheme.whiteColor,
                                dividerColor: appCtrl.appTheme.contentColor
                                    .withOpacity(.5),
                                quantityBorderColor:
                                    appCtrl.appTheme.lightPrimary,
                                titleColor: appCtrl.appTheme.titleColor,
                                plusTap: () => searchCtrl.plusTap(index),
                                minusTap: () => searchCtrl.minusTap(index),
                              ),
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
  }
}

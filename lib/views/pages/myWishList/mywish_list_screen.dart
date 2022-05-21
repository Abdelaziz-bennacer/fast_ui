import 'package:fast_ui/controllers/mywish_list_controller.dart';
import 'package:fast_ui/views/pages/myWishList/mywish_list_card.dart';
import 'package:fast_ui/views/pages/myWishList/util/mywish_list_widget.dart';
import 'package:fast_ui/views/pages/myWishList/util/mywish_list_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../config.dart';

class MyWishListScreen extends StatelessWidget {
  final wishListCtrl = Get.put(MyWishListController());

  MyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => AppComponent(
        child: GetBuilder<MyWishListController>(builder: (_) {
          return Scaffold(
            appBar: MyWishListWidget().appbarLayout(
                bgColor: wishListCtrl.appCtrl.appTheme.whiteColor,
                titleColor: wishListCtrl.appCtrl.appTheme.titleColor,
                text: MyWishListFont().myWishList,
                onTap: () => Get.toNamed(routeName.myCart, arguments: true)),
            backgroundColor: wishListCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
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
                            height: MediaQuery.of(context).size.height,
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
                                      Expanded(
                                        flex: 2,
                                        child: Container(
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
                                        ),
                                      )
                                    ],
                                  ),

                                  // The child of the Slidable is what the user sees when the
                                  // component is not dragged.
                                  child: MyWishListCard(
                                    data: wishListCtrl.offerList[index],
                                    containerboxColor: wishListCtrl
                                        .appCtrl.appTheme.wishtListBoxColor,
                                    descriptionColor: wishListCtrl
                                        .appCtrl.appTheme.darkContentColor,
                                    discountBoxColor:
                                        wishListCtrl.appCtrl.appTheme.primary,
                                    discountTextColor: wishListCtrl
                                        .appCtrl.appTheme.whiteColor,
                                    dividerColor: wishListCtrl
                                        .appCtrl.appTheme.contentColor
                                        .withOpacity(.5),
                                    quantityBorderColor: wishListCtrl
                                        .appCtrl.appTheme.lightPrimary,
                                    titleColor: wishListCtrl
                                        .appCtrl.appTheme.titleColor,
                                    plusTap: () => wishListCtrl.plusTap(index),
                                    minusTap: () =>
                                        wishListCtrl.minusTap(index),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

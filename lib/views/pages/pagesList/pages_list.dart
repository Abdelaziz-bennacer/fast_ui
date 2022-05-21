import 'package:fast_ui/controllers/pages_list_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fast_ui/views/pages/pagesList/util/page_list_constants.dart';
import 'package:fast_ui/views/pages/pagesList/util/page_list_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class PagesList extends StatelessWidget {
  final pageCtrl = Get.put(PagesListController());

  PagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<PagesListController>(builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Scaffold(
            backgroundColor: pageCtrl.appCtrl.appTheme.whiteColor,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: pageCtrl.appCtrl.appTheme.whiteColor,
              titleSpacing: 0,
              centerTitle: false,
              leading: PageListWidget().appBarLeadingLayput(
                  onTap: () => Get.back(),
                  borderColor: pageCtrl.appCtrl.appTheme.titleColor,
                  iconColor: pageCtrl.appCtrl.appTheme.titleColor,
                  image: pageCtrl.appCtrl.isTheme
                      ? imageAssets.themeFkLogo
                      : imageAssets.fkLogo),
              title: PageListWidget().appBarTitleLayout(
                  text: PageListFont().pagesList,
                  textColor: pageCtrl.appCtrl.appTheme.titleColor),
              actions: [
                PageListWidget().appBarActionLayout(
                    iconColor: pageCtrl.appCtrl.appTheme.titleColor,
                    onTap: () => pageCtrl.goToHome()),
              ],
            ),
            bottomNavigationBar: BottomNavigatorCard(
              selectedIndex: pageCtrl.appCtrl.selectedIndex,
              onTap: (val) async {
                Get.back();
                if (pageCtrl.appCtrl.selectedIndex == 4) {
                  Get.toNamed(routeName.myCart, arguments: false);
                } else {
                  await pageCtrl.appCtrl.getStorage
                      .write('selectedIndex', pageCtrl.appCtrl.selectedIndex);
                  pageCtrl.appCtrl.selectedIndex = val;
                  pageCtrl.appCtrl.update();
                }
              },
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  //description layout
                  PageListWidget().descriptionLayout(
                      context: context,
                      boxColor: pageCtrl.appCtrl.appTheme.wishtListBoxColor,
                      titleColor: pageCtrl.appCtrl.appTheme.titleColor),
                  //page list Layout

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: ListView.builder(
                        itemCount: AppArray().pagesList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              onTap: () async {
                                if (index == 0) {
                                  Get.toNamed(routeName.error404page);
                                } else if (index == 1) {
                                  Get.toNamed(routeName.aboutUs);
                                } else if (index == 2) {
                                  Get.toNamed(routeName.yourAccount);
                                } else if (index == 3) {
                                  Get.toNamed(routeName.addAddress);
                                } else if (index == 4) {
                                  Get.toNamed(routeName.addressList);
                                } else if (index == 5) {
                                  Get.toNamed(
                                    routeName.myCart,
                                    arguments: true,
                                  );
                                } else if (index == 6) {
                                  Get.back();
                                  await pageCtrl.appCtrl.getStorage.write(
                                      'selectedIndex',
                                      pageCtrl.appCtrl.selectedIndex);
                                  pageCtrl.appCtrl.selectedIndex = 1;
                                } else if (index == 7) {
                                  Get.back();
                                  await pageCtrl.appCtrl.getStorage.write(
                                      'selectedIndex',
                                      pageCtrl.appCtrl.selectedIndex);
                                  pageCtrl.appCtrl.selectedIndex = 0;
                                } else if (index == 8) {
                                  Get.toNamed(routeName.login);
                                } else if (index == 9) {
                                  Get.toNamed(routeName.notification);
                                } else if (index == 10) {
                                  Get.back();
                                  await pageCtrl.appCtrl.getStorage.write(
                                      'selectedIndex',
                                      pageCtrl.appCtrl.selectedIndex);
                                  pageCtrl.appCtrl.selectedIndex = 3;
                                } else if (index == 11) {
                                  Get.toNamed(routeName.onBoarding);
                                } else if (index == 12) {
                                  Get.toNamed(routeName.orderDetail);
                                } else if (index == 13) {
                                  Get.toNamed(routeName.orderHistory);
                                } else if (index == 14) {
                                  Get.toNamed(routeName.orderSuccess);
                                } else if (index == 15) {
                                  Get.toNamed(routeName.orderTrack);
                                } else if (index == 16) {
                                  Get.toNamed(routeName.paymentScreen);
                                } else if (index == 17) {
                                  Get.toNamed(routeName.productDetail);
                                } else if (index == 18) {
                                  Get.toNamed(routeName.signup);
                                } else if (index == 19) {
                                  await pageCtrl.appCtrl.getStorage.write(
                                      'selectedIndex',
                                      pageCtrl.appCtrl.selectedIndex);
                                  pageCtrl.appCtrl.selectedIndex = 2;
                                } else if (index == 20) {
                                  Get.toNamed(routeName.setting);
                                } else if (index == 21) {
                                  Get.toNamed(routeName.shopScreen);
                                } else if (index == 22) {
                                  Get.toNamed(routeName.myWishList);
                                }
                              },
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: pageCtrl.appCtrl.appTheme.titleColor,
                                size: AppScreenUtil().screenHeight(18.0),
                              ),
                              title: Text(AppArray()
                                  .pagesList[index]['name']
                                  .toString()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

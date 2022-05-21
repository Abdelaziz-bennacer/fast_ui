import 'package:fast_ui/controllers/your_account_controller.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fast_ui/views/pages/yourAccount/util/your_account_widget.dart';
import 'package:fast_ui/views/pages/yourAccount/util/your_account_constants.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

// ignore: must_be_immutable
class YourAccount extends StatelessWidget {
  var yourAccountCtrl = Get.put(YourAccountController());

  YourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => GetBuilder<YourAccountController>(builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Scaffold(
            backgroundColor: yourAccountCtrl.appCtrl.appTheme.whiteColor,
            appBar: YourAccountWidget().appBarLayout(
                bgColor: yourAccountCtrl.appCtrl.appTheme.whiteColor,
                titleColor: yourAccountCtrl.appCtrl.appTheme.titleColor,
                text: YourAccountFont().yourAccount,
                onTap: () => yourAccountCtrl.goToHome()),
            bottomNavigationBar: BottomNavigatorCard(
              selectedIndex: yourAccountCtrl.appCtrl.selectedIndex,
              onTap: (val) async {
                Get.back();
                Get.back();
                if (yourAccountCtrl.appCtrl.selectedIndex == 4) {
                  Get.toNamed(routeName.myCart, arguments: false);
                } else {
                  Get.back();
                  await yourAccountCtrl.appCtrl.getStorage.write(
                      'selectedIndex', yourAccountCtrl.appCtrl.selectedIndex);
                  yourAccountCtrl.appCtrl.selectedIndex = val;
                  yourAccountCtrl.appCtrl.update();
                }
                yourAccountCtrl.appCtrl.update();
              },
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Drawer header
                        YourAccountWidget().userDetail(
                            color: yourAccountCtrl
                                .appCtrl.appTheme.wishtListBoxColor,
                            context: context,
                            borderRaius: 50,
                            image: imageAssets.usersquare,
                            imageHeight: 50,
                            userName: YourAccountFont().userName,
                            userEmail: YourAccountFont().userEmail,
                            userNameFontColor:
                                yourAccountCtrl.appCtrl.appTheme.titleColor,
                            emailFontColor: yourAccountCtrl
                                .appCtrl.appTheme.darkContentColor,
                            nameFontSize: 14,
                            emailFontSize: 12),

                        //divider layout
                        YourAccountWidget().dividerLineLayout(
                            height: 48,
                            horizontalPadding: 10,
                            color: yourAccountCtrl.appCtrl.appTheme.borderGray),

                        //drawer list
                        ...AppArray().drawerList.asMap().entries.map((e) {
                          return e.key == 10
                              ? YourAccountWidget().logoutButton(
                                  boxColor: yourAccountCtrl
                                      .appCtrl.appTheme.wishtListBoxColor,
                                  text: e.value['title'],
                                  textColor: yourAccountCtrl
                                      .appCtrl.appTheme.titleColor,
                                  onTap: () {
                                    Get.back();
                                    Get.offAllNamed(routeName.login);
                                  })
                              : YourAccountWidget().commonDrawerListTile(
                                  image: e.value['icon'],
                                  title: e.value['title'],
                                  color: e.key ==
                                          yourAccountCtrl
                                              .appCtrl.drawerSelectedIndex
                                      ? yourAccountCtrl
                                          .appCtrl.appTheme.whiteColor
                                      : yourAccountCtrl
                                          .appCtrl.appTheme.arrowSelectColor,
                                  status2: yourAccountCtrl.appCtrl.isTheme,
                                  toggleColor: yourAccountCtrl
                                      .appCtrl.appTheme.greyBGColor,
                                  activeColor: yourAccountCtrl
                                      .appCtrl.appTheme.titleColor,
                                  inactiveColor:
                                      yourAccountCtrl.appCtrl.appTheme.white,
                                  onToggle: (val) {
                                    yourAccountCtrl.appCtrl.isTheme = val;
                                    yourAccountCtrl.appCtrl.update();
                                    ThemeService().switchTheme(val);
                                  },
                                  activeIconColor:
                                      yourAccountCtrl.appCtrl.appTheme.green,
                                  onTap: () async {
                                    yourAccountCtrl.appCtrl
                                        .onSelectIndex(e.key);
                                    if (e.key == 0) {
                                      await yourAccountCtrl.appCtrl.getStorage
                                          .write(
                                              'selectedIndex',
                                              yourAccountCtrl
                                                  .appCtrl.selectedIndex);
                                      yourAccountCtrl.appCtrl.update();
                                    } else if (e.key == 1) {
                                      Get.back();
                                      Get.toNamed(routeName.pageList);
                                    } else if (e.key == 2) {
                                      Get.back();
                                      await yourAccountCtrl.appCtrl.getStorage
                                          .write(
                                              'selectedIndex',
                                              yourAccountCtrl
                                                  .appCtrl.selectedIndex);
                                      yourAccountCtrl.appCtrl.selectedIndex = 1;
                                    } else if (e.key == 3) {
                                      Get.back();
                                      Get.toNamed(routeName.orderHistory);
                                    } else if (e.key == 4) {
                                      Get.back();
                                      Get.toNamed(routeName.myWishList);
                                    } else if (e.key == 5) {
                                      yourAccountCtrl.appCtrl
                                          .bottomSheet(context: context);
                                    } else if (e.key == 6) {
                                      Get.back();
                                      Get.toNamed(routeName.yourAccount);
                                    } else if (e.key == 7) {
                                      Get.back();
                                      Get.toNamed(routeName.notification);
                                    } else if (e.key == 8) {
                                      Get.back();
                                      Get.toNamed(routeName.setting);
                                    } else if (e.key == 10) {
                                      Get.back();
                                      Get.offAllNamed(routeName.login);
                                    }
                                    yourAccountCtrl.appCtrl.update();
                                  },
                                  textColor: yourAccountCtrl
                                      .appCtrl.appTheme.titleColor,
                                  iconColor: yourAccountCtrl
                                      .appCtrl.appTheme.titleColor,
                                  height: 20,
                                  fontSize: 14,
                                  context: context,
                                  inActiveIconColor:
                                      yourAccountCtrl.appCtrl.appTheme.gray,
                                  selectedColor: yourAccountCtrl
                                      .appCtrl.appTheme.whiteColor);
                        }).toList(),
                        const Space(0, 200)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:fast_ui/controllers/notification_controller.dart';
import 'package:fast_ui/views/pages/notification/notification_card.dart';
import 'package:fast_ui/views/pages/notification/util/notification_constants.dart';
import 'package:fast_ui/views/pages/notification/util/notification_fontstyle.dart';
import 'package:fast_ui/views/pages/notification/util/notification_widget.dart';

import 'package:flutter/material.dart';

import '../../../config.dart';

class Notification extends StatelessWidget {
  final notificationCtrl = Get.put(NotificationController());

  Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return AppComponent(
        child: GetBuilder<NotificationController>(builder: (_) {
          return Scaffold(
            appBar: NotificationWidget().appBarLayout(
                bgColor: notificationCtrl.appCtrl.appTheme.whiteColor,
                titleColor: notificationCtrl.appCtrl.appTheme.titleColor,
                text: NotificationFont().notification,
                onTap: () => notificationCtrl.goToHome()),
            backgroundColor: notificationCtrl.appCtrl.appTheme.whiteColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Container(
                  color: notificationCtrl.appCtrl.appTheme.whiteColor,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        //days and mark read all layout
                        NotificationWidget().categoryLayout(
                            context: context,
                            color:
                                notificationCtrl.appCtrl.appTheme.textBoxColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: NotificationWidget().tabBarLayout(
                                      controller:
                                          notificationCtrl.tabController,
                                      titleColor: notificationCtrl
                                          .appCtrl.appTheme.titleColor,
                                      primary: notificationCtrl
                                          .appCtrl.appTheme.primary,
                                      tab1: NotificationFont().alert,
                                      tab2: NotificationFont().offers),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      iconAssets.check,
                                      height: AppScreenUtil().screenHeight(20),
                                    ),
                                    NotificationFontStyle().mulishtextLayout(
                                        text: NotificationFont().markRead,
                                        color: notificationCtrl
                                            .appCtrl.appTheme.primary,
                                        fontSize: NotificationFontSize
                                            .textSizeSMedium)
                                  ],
                                )
                              ],
                            )),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(750),
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: notificationCtrl.tabController,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          AppScreenUtil().screenWidth(15)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: notificationCtrl
                                        .notificationList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppScreenUtil()
                                                .screenWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            NotificationWidget().titleLayout(
                                                text: notificationCtrl
                                                    .notificationList[index]
                                                        ['day']
                                                    .toString(),
                                                color: notificationCtrl.appCtrl
                                                    .appTheme.darkContentColor),
                                            ...notificationCtrl
                                                .notificationList[index]
                                                    ['child']
                                                .map((e) {
                                              return NotificationCard(
                                                data: e,
                                                titleColor: notificationCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .titleColor,
                                                dateColor: notificationCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .darkContentColor,
                                                primaryColor: notificationCtrl
                                                    .appCtrl.appTheme.primary,
                                              );
                                            }).toList()
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          AppScreenUtil().screenWidth(15)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: notificationCtrl
                                        .notificationList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppScreenUtil()
                                                .screenWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            NotificationWidget().titleLayout(
                                                text: notificationCtrl
                                                    .notificationList[index]
                                                        ['day']
                                                    .toString(),
                                                color: notificationCtrl.appCtrl
                                                    .appTheme.darkContentColor),
                                            ...notificationCtrl
                                                .notificationList[index]
                                                    ['child']
                                                .map((e) {
                                              return NotificationCard(
                                                data: e,
                                                titleColor: notificationCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .titleColor,
                                                dateColor: notificationCtrl
                                                    .appCtrl
                                                    .appTheme
                                                    .darkContentColor,
                                                primaryColor: notificationCtrl
                                                    .appCtrl.appTheme.primary,
                                              );
                                            }).toList()
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}

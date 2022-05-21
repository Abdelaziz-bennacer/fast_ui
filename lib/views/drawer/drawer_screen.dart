import 'package:fast_ui/views/drawer/util/drawer_constants.dart';
import 'package:fast_ui/views/drawer/util/drawer_fontstyle.dart';
import 'package:fast_ui/views/drawer/util/drawer_header.dart';
import 'package:fast_ui/views/drawer/util/drawer_widget.dart';
import 'package:flutter/material.dart';
import '../../common/app_screen_util.dart';
import '../../common/assets/index.dart';
import '../../common/theme/theme_service.dart';
import '../../config.dart';
import '../../controllers/common/app_controller.dart';
import '../../extensions/spacing.dart';
import '../../utilities/app_array.dart';
import 'contact_us.dart';

class DrawerScreen extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) => ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
            bottomRight: Radius.circular(AppScreenUtil().borderRadius(20))),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: Container(
            color: appCtrl.appTheme.whiteColor,
            width: MediaQuery.of(context).size.width *
                AppScreenUtil().screenWidth(0.75),
            child: Drawer(
                backgroundColor: appCtrl.appTheme.whiteColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(8)),
                          child: Column(
                            children: [
                              //Drawer header
                              DrawerCustomHeader(
                                  borderRaius: 50,
                                  image: imageAssets.usersquare,
                                  imageHeight: 50,
                                  userName: DrawerFont().userName,
                                  userEmail: DrawerFont().userEmail,
                                  userNameFontColor:
                                      appCtrl.appTheme.titleColor,
                                  emailFontColor:
                                      appCtrl.appTheme.darkContentColor,
                                  nameFontSize: 14,
                                  emailFontSize: 12),

                              //divider layout
                              DrawerWidget().dividerLineLayout(
                                  height: 48,
                                  horizontalPadding: 10,
                                  color: appCtrl.appTheme.borderGray),

                              //drawer list
                              ...AppArray().drawerList.asMap().entries.map((e) {
                                return DrawerWidget().commonDrawerListTile(
                                    image: e.value['icon'],
                                    title: e.value['title'].toString(),
                                    color: e.key == appCtrl.drawerSelectedIndex
                                        ? appCtrl.appTheme.whiteColor
                                        : appCtrl.appTheme.arrowSelectColor,
                                    status2: appCtrl.isTheme,
                                    toggleColor: appCtrl.appTheme.greyBGColor,
                                    activeColor: appCtrl.appTheme.titleColor,
                                    inactiveColor: appCtrl.appTheme.white,
                                    onToggle: (val) {
                                      appCtrl.isTheme = val;
                                      appCtrl.update();
                                      ThemeService().switchTheme(val);
                                    },
                                    activeIconColor: appCtrl.appTheme.green,
                                    onTap: () async {
                                      appCtrl.selectPage(
                                          index: e.key, context: context);
                                    },
                                    textColor: e.key == 9
                                        ? appCtrl.appTheme.titleColor
                                        : e.key == appCtrl.drawerSelectedIndex
                                            ? appCtrl.appTheme.drawerSelectColor
                                            : appCtrl.appTheme.titleColor,
                                    iconColor: e.key == 9
                                        ? appCtrl.appTheme.titleColor
                                        : e.key == appCtrl.drawerSelectedIndex
                                            ? appCtrl.appTheme.drawerSelectColor
                                            : appCtrl.appTheme.titleColor,
                                    height: 20,
                                    fontSize: 14,
                                    context: context,
                                    inActiveIconColor: appCtrl.appTheme.gray,
                                    selectedColor: e.key == 9
                                        ? appCtrl.appTheme.whiteColor
                                        : e.key == appCtrl.drawerSelectedIndex
                                            ? appCtrl.appTheme.primary
                                            : appCtrl.appTheme.whiteColor);
                              }).toList(),
                              const Space(0, 200)
                            ],
                          ),
                        ),
                      ],
                    ),

                    //CONTACT US LAYOUT
                    ContactUsLayout(
                      height: 150,
                      containerColor: appCtrl.appTheme.arrowSelectColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //contact support text layout
                          DrawerWidget().contactSupport(
                              title: DrawerFont().contactSupport,
                              fontSize: 13,
                              color: appCtrl.appTheme.titleColor),
                          const Space(0, 5),

                          //contact support description
                          DrawerFontStyle().mulishtextLayout(
                              text: DrawerFont().contactSupportDesc,
                              fontSize: 12,
                              color: appCtrl.appTheme.darkContentColor,
                              overflow: TextOverflow.clip),
                          const Space(0, 15),

                          //contact us button
                          DrawerWidget().contactUsButtonLayout(
                              text: DrawerFont().contactUs,
                              buttonColor: appCtrl.appTheme.primary,
                              textColor: appCtrl.appTheme.white)
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

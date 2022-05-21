import 'dart:async';

import 'package:fast_ui/views/drawer/drawer_screen.dart';
import 'package:fast_ui/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fast_ui/widgets/common_appbar_widget/common_appbar.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Timer? timer;
  var appCtrl = Get.put(AppController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (ctrl) => WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerScreen(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppScreenUtil().screenHeight(300)),
            child: Offstage(
              offstage: appCtrl.selectedIndex == 4 ? true : false,
              child: CommonAppBar1(
                onTap: () async {
                  if (appCtrl.selectedIndex == 3 ||
                      appCtrl.selectedIndex == 1) {
                    int index = await appCtrl.getStorage.read('selectedIndex');
                    appCtrl.selectedIndex = index;
                    appCtrl.update();
                  } else {
                    _scaffoldKey.currentState!.openDrawer();
                  }
                },
                actionTap: () {
                  if (appCtrl.selectedIndex == 0) {
                    Get.toNamed(routeName.setting);
                  } else if (appCtrl.selectedIndex == 1) {
                    Get.toNamed(routeName.myCart, arguments: true);
                  }
                },
                isTheme: appCtrl.isTheme,
                borderColor: appCtrl.appTheme.titleColor,
                color: appCtrl.appTheme.titleColor,
                isWishListText: appCtrl.selectedIndex == 4 ? true : false,
                isCart: appCtrl.selectedIndex == 1 ? true : false,
                isLocation:
                    (appCtrl.selectedIndex == 0 || appCtrl.selectedIndex == 2)
                        ? true
                        : false,
                isback: (appCtrl.selectedIndex == 1 ||
                        appCtrl.selectedIndex == 3 ||
                        appCtrl.selectedIndex == 4)
                    ? true
                    : false,
                isCategory:
                    (appCtrl.selectedIndex == 0 || appCtrl.selectedIndex == 2)
                        ? true
                        : false,
                isHome:
                    (appCtrl.selectedIndex == 3 || appCtrl.selectedIndex == 4)
                        ? true
                        : false,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigatorCard(
            selectedIndex: appCtrl.selectedIndex,
            onTap: (val) async {
              if (appCtrl.selectedIndex == 4) {
                Get.toNamed(routeName.myCart, arguments: false);
              } else {
                await appCtrl.getStorage
                    .write('selectedIndex', appCtrl.selectedIndex);
                appCtrl.selectedIndex = val;
                appCtrl.update();
              }
            },
          ),
          body: appCtrl.widgetOptions.elementAt(appCtrl.selectedIndex),
        ),
      ),
    );
  }
}

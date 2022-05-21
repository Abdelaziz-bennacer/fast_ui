import 'package:fast_ui/utilities/responsive_layout.dart';
import 'package:fast_ui/views/pages/home_screen/util/large_screen.dart';
import 'package:fast_ui/views/pages/home_screen/util/medium_screen.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: const ResponsiveWidget(
            //if screen height is large
            largeScreen: HomeLagreScreen(),
            //if screen height in medium
            mediumScreen: HomeMediumScreen(),
          ),
        ),
      ),
    );
  }
}

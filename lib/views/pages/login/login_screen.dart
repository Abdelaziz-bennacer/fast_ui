import 'package:fast_ui/utilities/responsive_layout.dart';
import 'package:fast_ui/views/pages/login/util/large_screen.dart';
import 'package:fast_ui/views/pages/login/util/medium_screen.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appCtrl.appTheme.primary,
        body: const ResponsiveWidget(
          //if screen height is large
          largeScreen: LargeScreen(),
          //if screen height in medium
          mediumScreen: MediumScreen(),
        ),
      ),
    );
  }
}

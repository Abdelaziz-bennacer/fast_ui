import 'package:fast_ui/views/pages/splash_screen/util/splash_widget.dart';
import 'package:flutter/material.dart';

import 'package:fast_ui/config.dart';
import 'package:fast_ui/controllers/spalsh_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var splashCtrl = Get.put(SplashController());
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
    //  getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (cntrl) {
      return WillPopScope(
        onWillPop: () async {
          return Future(() => false);
        },
        child: Scaffold(
          body: GetBuilder<SplashController>(
            builder: (_) => Stack(
              children: [
                //Back Image Layout
                SplashWidget().backgroundImage(
                    image: imageAssets.splashBGImage,
                    height: 1.6,
                    context: context),
                //splash logo Layout
                appCtrl.isTheme
                    ? SplashWidget().splashLogo(
                        image: imageAssets.themeLogo,
                        width: 3.5,
                        context: context)
                    : SplashWidget().splashLogo(
                        image: imageAssets.logo, width: 4, context: context)
              ],
            ),
          ),
        ),
      );
    });
  }
}

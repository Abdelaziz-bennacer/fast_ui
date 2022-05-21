import 'package:fast_ui/config.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppComponent(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page 2"),
          actions: [
            TextButton(
              onPressed: () {
                // ThemeService().switchTheme();
              },
              child: Text(
                "Change",
                style: AppCss.h2.textColor(appCtrl.appTheme.darkGray),
                //style: AppCss.h2.textColor(context.theme.secondaryHeaderColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              "Hii from page 2",
              style: AppCss.h2.textColor(appCtrl.appTheme.txt),
            ),
          ],
        ).paddingAll(Insets.i24),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/common/app_controller.dart';

// ignore: must_be_immutable
class AppComponent extends StatelessWidget {
  final Widget? child;
  AppComponent({Key? key, this.child}) : super(key: key);
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: GetBuilder<AppController>(
        builder: (ctrl) {
          return Stack(
            children: [
              child!,
              ctrl.isLoading == true
                  ? Container(
                      color: Colors.black26.withOpacity(.4),
                      child: Center(
                        child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    appCtrl.appTheme
                                        .primary), // appColor.primaryColor
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

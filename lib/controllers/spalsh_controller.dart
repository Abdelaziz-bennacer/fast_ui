import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fast_ui/config.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  bool isTheme = false;
  final storage = GetStorage();
  @override
  void onInit() async {
    await Future.delayed(Durations.s3);
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {
    update();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String? isIntro = storage.read('isIntro');
    if (isIntro == "false" || isIntro == null) {
      Get.toNamed(routeName.onBoarding);
    } else {
      if (user == null) {
        // Cheking if user is already login or not
        Get.toNamed(routeName.login);
      } else {
        Get.toNamed(routeName.dashboard);
      }
    }
  }
}

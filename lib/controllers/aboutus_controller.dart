// ignore_for_file: file_names

import 'package:fast_ui/config.dart';
import 'package:get_storage/get_storage.dart';
import 'common/app_controller.dart';

class AboutUsController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final getStorage = GetStorage();

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }
}

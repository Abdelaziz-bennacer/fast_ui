import 'package:fast_ui/config.dart';

class AddressListController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int selectedIndex = 0;

  //select Address
  selectAddress(index) {
    selectedIndex = index;
    update();
  }
}

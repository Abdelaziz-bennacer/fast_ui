import 'package:fast_ui/config.dart';
import 'package:get_storage/get_storage.dart';

class AddAddressController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final getStorage = GetStorage();

  //go to Search
  goToSearch() async {
    Get.back();
    await getStorage.write('selectedIndex', 2);
    appCtrl.selectedIndex = 2;
    update();
  }
}

import 'package:fast_ui/config.dart';

import '../utilities/app_array.dart';

class MyWishListController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List offerList = [];

  //quantity increment function
  plusTap(index) {
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //quantity decrement function
  minusTap(index) {
    if (offerList[index]['quantity'] != 0) {
      if (offerList[index]['quantity'] == "0") {
        offerList[index]['quantity'] = "0";
        update();
      } else {
        int count = int.parse(offerList[index]['quantity'].toString());
        count = count - 1;
        offerList[index]['quantity'] = count.toString();
        update();
      }
    }
  }

  getData() {
    offerList = AppArray().offerList;
    update();
    appCtrl.hideLoading();
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.showLoading();
    appCtrl.update();
    getData();
    super.onReady();
  }
}

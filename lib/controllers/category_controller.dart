import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../utilities/app_array.dart';

class CategoryController extends GetxController {
  int selectIndex = 1;
  List subCategoryList = [];

  //ontap category index change
  onTap(index) {
    subCategoryList = [];
    for (int i = 0; i < AppArray().subCategoryData.length; i++) {
      if (AppArray().subCategoryData[i]['categoryId'].toString() ==
          index.toString()) {
        subCategoryList.add(AppArray().subCategoryData[i]);
      }
    }
    selectIndex = index;
    update();
  }

  //get data on init
  getData() {
    for (int i = 0; i < AppArray().subCategoryData.length; i++) {
      if (AppArray().subCategoryData[i]['categoryId'].toString() ==
          selectIndex.toString()) {
        subCategoryList.add(AppArray().subCategoryData[i]);
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}

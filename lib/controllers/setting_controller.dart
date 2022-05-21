import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/setting/util/setting_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class SettingController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  final FocusNode userFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isEmail = false;
  String errorEmail = SettingFont().userFieldError;
  bool isPassword = false;
  bool passwordVisible = true;

  String date = "";
  DateTime selectedDate = DateTime.now();
  final getStorage = GetStorage();

  //go to home
  goToHome() async {
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

//date picker
  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
    }
    dateCtrl.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    update();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../config.dart';

class SignupController extends GetxController {
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final storage = GetStorage();
  var auth = FirebaseAuth.instance;

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //google Login function
  googleLogin() async {
    appCtrl.showLoading();
    update();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      appCtrl.hideLoading();
      update();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      (await _auth.signInWithCredential(credential)).user;
      appCtrl.hideLoading();
      update();
      saveData(googleSignInAccount.id);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException {
      appCtrl.hideLoading();
      update();
      rethrow;
    }
  }

  //save data in shared pref
  saveData(userid) async {
    await storage.write('id', userid);
    update();
    Get.toNamed(routeName.dashboard);
  }


//sign in tap function
  signInClick({context}) async {
    appCtrl.showLoading();
    update();
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      appCtrl.hideLoading();
      update();
      email.text = "";
      password.text = "";
      FocusScope.of(context).requestFocus(FocusNode());

      Get.back();
    } catch (e) {
      appCtrl.hideLoading();
      update();
      showToast(e.toString());
    }
  }


  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }
}

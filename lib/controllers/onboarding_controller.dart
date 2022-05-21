import 'package:fast_ui/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardingController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  String? text;
  final getStorage = GetStorage();

  //onboarding read;
  onBoardingRead() async {
    await getStorage.write('isIntro', 'true');

    update();
    Get.toNamed(routeName.login);
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
    await getStorage.write('id', userid);
    await getStorage.write('id', userid);

    update();
    Get.toNamed(routeName.dashboard);
  }
}

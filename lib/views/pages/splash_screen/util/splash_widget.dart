import 'package:flutter/cupertino.dart';

class SplashWidget {
  //splash background Image
  Widget backgroundImage(
      {String? image, BuildContext? context, double? height}) {
    return Container(
      height: MediaQuery.of(context!).size.height / height!,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image!,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  //splash logo layout
  Widget splashLogo({String? image, BuildContext? context, double? width}) {
    return Positioned(
      bottom: 20,
      left: MediaQuery.of(context!).size.width /width!,
      child: Image.asset(
        image!,
      ),
    );
  }
}

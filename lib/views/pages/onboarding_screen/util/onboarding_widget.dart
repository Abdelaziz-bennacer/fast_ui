import 'package:flutter/material.dart';

class OnboardingWidget{

  //background Image
  Widget backgroundImage({String? image,double? height,BuildContext? context}){
    return Container(
      height: MediaQuery.of(context!).size.height/height!,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image!,),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
  //small logo Image
  Widget smallLogoImage({String? image,BuildContext? context}){
    return Image.asset(image!,width: MediaQuery.of(context!).size.width);
  }

}
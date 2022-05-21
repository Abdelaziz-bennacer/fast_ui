import 'package:fast_ui/config.dart';
import 'package:fast_ui/models/coupon_model.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final int? index;
  final Color? primaryColor;
  final Color? dottedLineColor;
  final Color? titleColor;
  final Color? decriptionColor;
  final CouponModel? couponModel;
  final bool? isTheme;

  const CouponCard(
      {Key? key,
      this.index,
      this.primaryColor,
      this.titleColor,
      this.dottedLineColor,
      this.couponModel,
      this.decriptionColor,
      this.isTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: index == 0 ? 0 : AppScreenUtil().screenWidth(12),
          right: AppScreenUtil().screenWidth(12),
          top: AppScreenUtil().screenWidth(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            isTheme! ? couponModel!.themeBG : couponModel!.bG,
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 130 : 150),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  couponModel!.image,
                  width: 100,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              const Space(0, 10),
              HomeFontStyle().mulishtextLayout(
                  text: couponModel!.title,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: titleColor),
              const Space(0, 5),
              HomeFontStyle().mulishtextLayout(
                  text: couponModel!.upToText,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: decriptionColor)
            ],
          ),
          /* Stack(
            children: [
              Container(
                height: 130,
                width: 160,
                color: couponModel!.color,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 15,left: 10,right: 10),
                      child: Image.asset(couponModel!.image,width: 100,height: 40,fit: BoxFit.fill,),
                    ),
                    Space(0, 10),
                    HomeFontStyle().mulishtextLayout(
                      text: couponModel!.title,
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                    ),
                    Space(0, 5),
                    HomeFontStyle().mulishtextLayout(
                      text: couponModel!.upToText,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: decriptionColor
                    )
                  ],
                ),
              ),
              Positioned(
                top: -7,
                left: -7,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: -8,
                left: MediaQuery.of(context).size.width / 2.8,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: 55,
                left: -8,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: 55,
                left: MediaQuery.of(context).size.width / 2.8,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: 115,
                left: -8,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: 115,
                left: MediaQuery.of(context).size.width / 2.7,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
          DottedLine(
            direction: Axis.horizontal,
            dashLength: 7,
            lineLength: 128,
            dashGapLength: 8,
            dashColor: dottedLineColor,
            lineThickness: 2,
            dashRadius: 2,
          ),*/
        ],
      ),
    );
  }
}

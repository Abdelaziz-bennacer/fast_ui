import 'package:fast_ui/views/pages/myCart/util/mycart_fontstyle.dart';
import 'package:fast_ui/views/pages/myCart/util/mycart_constants.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../utilities/app_array.dart';

class OfferUICard extends StatelessWidget {
  final bool? isTheme;
  final Color? discountColor;
  final Color? titleColor;
  final Color? darkContentColor;
  final Color? whiteColor;
  final GestureTapCallback? onTap;
  const OfferUICard(
      {Key? key,
      this.isTheme,
      this.discountColor,
      this.titleColor,
      this.darkContentColor,
      this.whiteColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppScreenUtil().screenHeight(100),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(10),
            right: AppScreenUtil().screenWidth(10),
            bottom: AppScreenUtil().screenHeight(15)),
        padding: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(20),
            right: AppScreenUtil().screenWidth(22)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isTheme! ? imageAssets.themeOfferBG : imageAssets.myCartBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MyCartFontStyle().quicksandtextLayout(
                    text: AppArray().myOfferList[0]['discount'].toString(),
                    color: discountColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                const Space(5, 0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCartFontStyle().quicksandtextLayout(
                        text: "%",
                        color: discountColor,
                        fontSize: MyCartFontSize.textXSizeSmall,
                        fontWeight: FontWeight.normal),
                    MyCartFontStyle().quicksandtextLayout(
                        text: "OFF",
                        color: discountColor,
                        fontSize: MyCartFontSize.textXSizeSmall,
                        fontWeight: FontWeight.normal)
                  ],
                ),
                const Space(5, 0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCartFontStyle().quicksandtextLayout(
                        text: AppArray().myOfferList[0]['title'].toString(),
                        color: titleColor,
                        fontSize: MyCartFontSize.textSizeSmall,
                        fontWeight: FontWeight.normal),
                    const Space(0, 2),
                    MyCartFontStyle().quicksandtextLayout(
                        text: AppArray().myOfferList[0]['des'].toString(),
                        color: darkContentColor,
                        fontSize: MyCartFontSize.textSizeSmall,
                        fontWeight: FontWeight.normal),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyCartFontStyle().quicksandtextLayout(
                    text: "Use Code:",
                    color: titleColor,
                    fontSize: MyCartFontSize.textSizeSmall,
                    fontWeight: FontWeight.normal),
                const Space(0, 2),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(5)),
                  decoration: BoxDecoration(
                      color: discountColor,
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(40))),
                  child: MyCartFontStyle().quicksandtextLayout(
                      text: AppArray().myOfferList[0]['code'].toString(),
                      color: whiteColor,
                      fontSize: MyCartFontSize.textSizeSmall,
                      fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

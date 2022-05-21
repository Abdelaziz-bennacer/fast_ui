import 'package:fast_ui/views/pages/offers/util/offer_constants.dart';
import 'package:fast_ui/views/pages/offers/util/offer_fontstyle.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class OfferListCard extends StatelessWidget {
  final dynamic data;
  final Color? primaryColor;
  final Color? titleColor;
  final Color? darkContentColor;
  final Color? whiteColor;
  final bool? isTheme;
  final GestureTapCallback? onTap;
  const OfferListCard(
      {Key? key,
      this.whiteColor,
      this.darkContentColor,
      this.titleColor,
      this.primaryColor,
      this.data,
      this.onTap,
      this.isTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppScreenUtil().screenHeight(100),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
        padding: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(20),
            right: AppScreenUtil().screenWidth(18)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isTheme! ? imageAssets.themeOfferBG : imageAssets.offerBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                OfferFontStyle().quicksandtextLayout(
                    text: data['discount'],
                    color: primaryColor,
                    fontSize: OfferFontSize.textSizeXLarge,
                    fontWeight: FontWeight.bold),
                const Space(5, 0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferFontStyle().quicksandtextLayout(
                        text: "%",
                        color: primaryColor,
                        fontSize: OfferFontSize.textSizeSMedium,
                        fontWeight: FontWeight.normal),
                    OfferFontStyle().quicksandtextLayout(
                        text: "OFF",
                        color: primaryColor,
                        fontSize: OfferFontSize.textSizeSmall,
                        fontWeight: FontWeight.normal)
                  ],
                ),
                const Space(5, 0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferFontStyle().quicksandtextLayout(
                        text: data['title'],
                        color: titleColor,
                        fontSize: OfferFontSize.textSizeSmall,
                        fontWeight: FontWeight.normal),
                    const Space(0, 2),
                    OfferFontStyle().quicksandtextLayout(
                        text: data['des'],
                        color: darkContentColor,
                        fontSize: OfferFontSize.textSizeSmall,
                        fontWeight: FontWeight.normal),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfferFontStyle().quicksandtextLayout(
                    text: "Use Code:",
                    color: titleColor,
                    fontSize: OfferFontSize.textSizeSmall,
                    fontWeight: FontWeight.normal),
                const Space(0, 2),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppScreenUtil().screenWidth(5)),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(40))),
                  child: OfferFontStyle().quicksandtextLayout(
                      text: data['code'],
                      color: whiteColor,
                      fontSize: OfferFontSize.textSizeSmall,
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

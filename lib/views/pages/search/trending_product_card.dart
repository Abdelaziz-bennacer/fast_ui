import 'package:fast_ui/controllers/search_controller.dart';
import 'package:fast_ui/views/pages/search/util/search_constants.dart';
import 'package:fast_ui/views/pages/search/util/search_fontstyle.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class TrendingProductCard extends StatelessWidget {
  final dynamic data;
  final Color? containerboxColor;
  final Color? dividerColor;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? discountBoxColor;
  final Color? discountTextColor;
  final Color? quantityBorderColor;
  final GestureTapCallback? minusTap;
  final GestureTapCallback? plusTap;

  const TrendingProductCard({
    Key? key,
    this.data,
    this.titleColor,
    this.containerboxColor,
    this.descriptionColor,
    this.discountBoxColor,
    this.dividerColor,
    this.discountTextColor,
    this.quantityBorderColor,
    this.minusTap,
    this.plusTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppScreenUtil().screenHeight(10),
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(15),
          horizontal: AppScreenUtil().screenHeight(10)),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: containerboxColor,
          borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(10))),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              data['image'].toString(),
              fit: BoxFit.fill,
              height: AppScreenUtil().screenHeight(45),
              width: AppScreenUtil().screenWidth(50),
            ),
            const Space(5, 0),
            VerticalDivider(
                color: dividerColor,
                width: 5,
                indent: 10,
                endIndent: 10,
                thickness: .5),
            const Space(5, 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchFontStyle().mulishtextLayout(
                    text: data['name'], fontSize: 13, color: titleColor),
                const Space(0, 2),
                SearchFontStyle().mulishtextLayout(
                    text: data['description'],
                    fontSize: 13,
                    color: descriptionColor),
                Row(
                  children: [
                    SearchFontStyle().mulishtextLayout(
                        text: SearchFont().dollar + data['price'].toString(),
                        fontSize: 12,
                        color: titleColor,
                        fontWeight: FontWeight.w700),
                    Container(
                      decoration: BoxDecoration(
                          color: discountBoxColor,
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(
                          left: AppScreenUtil().screenHeight(5)),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(10),
                          vertical: AppScreenUtil().screenHeight(3)),
                      child: SearchFontStyle().mulishtextLayout(
                        text: data['discount'].toString(),
                        fontSize: 10,
                        color: discountTextColor,
                      ),
                    ),
                    const Space(45, 0),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().screenHeight(8),
                          horizontal: AppScreenUtil().screenWidth(8)),
                      decoration: BoxDecoration(
                          color: discountTextColor,
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5)),
                          border: Border.all(color: quantityBorderColor!)),
                      child: GetBuilder<SearchController>(
                        builder: (controller) => Row(
                          children: [
                            InkWell(
                                onTap: minusTap,
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                )),
                            const Space(10, 0),
                            SearchFontStyle().mulishtextLayout(
                                text: data['quantity'].toString(),
                                fontSize: 14,
                                color: discountBoxColor),
                            const Space(10, 0),
                            InkWell(
                                onTap: plusTap,
                                child: const Icon(Icons.add, size: 18)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

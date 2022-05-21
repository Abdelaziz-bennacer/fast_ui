import 'package:fast_ui/views/pages/productDetail/util/product_detail_fontstyle.dart';
import 'package:fast_ui/views/pages/productDetail/util/product_detail_widget.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ReviewCard extends StatelessWidget {
  final dynamic data;
  final Color? glowColor;
  final Color? unratedColor;
  final Color? ratingColor;
  final Color? color;
  final Color? nameColor;
  final Color? descColor;
  const ReviewCard(
      {Key? key,
      this.data,
      this.glowColor,
      this.descColor,
      this.nameColor,
      this.ratingColor,
      this.color,
      this.unratedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(20)),
      decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                imageAssets.usersquare,
                height: AppScreenUtil().screenHeight(50),
              ),
              const Space(10, 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: AppScreenUtil().screenWidth(5)),
                    child: ProductDetailFontStyle().mulishtextLayout(
                        text: data['name'],
                        textAlign: TextAlign.start,
                        fontSize: 14,
                        color: nameColor,
                        fontWeight: FontWeight.w600),
                  ),
                  ProductDetailWidget().ratingLayout(
                      glowColor: glowColor,
                      unratedColor: unratedColor,
                      ratingColor: ratingColor,
                      value: double.parse(data['rating'].toString()),
                      onRatingUpdate: (rating) {}),
                ],
              )
            ],
          ),
          const Space(0, 10),
          ProductDetailFontStyle().mulishtextLayout(
              text: data['desc'],
              fontSize: 13,
              color: descColor,
              overflow: TextOverflow.clip,
              fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}

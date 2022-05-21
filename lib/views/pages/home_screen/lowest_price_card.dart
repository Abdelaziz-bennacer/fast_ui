import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_constants.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';

class LowestPriceCard extends StatelessWidget {
  final int? index;
  final Color? containerBorderColor;
  final dynamic data;
  final Color? descriptionColor;
  final Color? priceColor;
  final Color? primaryColor;
  final Color? iconColor;
  final Color? shadowColor;
  const LowestPriceCard(
      {Key? key,
      this.index,
      this.containerBorderColor,
      this.data,
      this.descriptionColor,
      this.priceColor,
      this.primaryColor,
      this.iconColor,
      this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.all(AppScreenUtil().size(10)),
      margin: EdgeInsets.only(
          left: AppScreenUtil().size(
            index == 0 ? 0 : 10,
          ),
          top: AppScreenUtil().screenHeight(10),
          bottom: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor!,
              blurRadius: 1, // Shadow position
            ),
          ],
          border: Border.all(color: containerBorderColor!),
          borderRadius:
              BorderRadius.circular(AppScreenUtil().borderRadius(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(iconAssets.heart),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    AppScreenUtil().screenWidth(8),
                    AppScreenUtil().screenHeight(4),
                    AppScreenUtil().screenWidth(8),
                    AppScreenUtil().screenWidth(8)),
                child: Image.asset(
                  data['image'].toString(),
                  height: 50,
                  width: 100,
                ),
              ),
            ],
          ),
          const Space(0, 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeFontStyle()
                        .mulishtextLayout(fontSize: 11, text: data['name']),
                    const Space(0, 5),
                    HomeFontStyle().mulishtextLayout(
                        fontSize: 10,
                        color: descriptionColor,
                        text: data['description']),
                    const Space(0, 5),
                    HomeFontStyle().mulishtextLayout(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: priceColor,
                        text: HomeFont().dollar + data['price'].toString()),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppScreenUtil().size(5)),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().borderRadius(5))),
                child: Icon(
                  Icons.add,
                  color: iconColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

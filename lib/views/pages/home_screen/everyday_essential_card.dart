import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_constants.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';

class EveryDayEssentialCard extends StatefulWidget {
  final int? index;
  final Color? containerBorderColor;
  final Color? boxColor;
  final dynamic data;
  final Color? descriptionColor;
  final Color? priceColor;
  final Color? primaryColor;
  final Color? iconColor;
  final Color? shadowColor;
  final Color? quantityColor;
  const EveryDayEssentialCard(
      {Key? key,
      this.index,
      this.containerBorderColor,
      this.boxColor,
      this.data,
      this.descriptionColor,
      this.priceColor,
      this.primaryColor,
      this.iconColor,
      this.shadowColor,
      this.quantityColor})
      : super(key: key);

  @override
  State<EveryDayEssentialCard> createState() => _EveryDayEssentialCardState();
}

class _EveryDayEssentialCardState extends State<EveryDayEssentialCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(routeName.productDetail),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.8,
        padding: EdgeInsets.all(AppScreenUtil().size(10)),
        margin: EdgeInsets.only(
            left: AppScreenUtil().size(
              widget.index == 0 ? 0 : 10,
            ),
            top: AppScreenUtil().screenHeight(10),
            bottom: AppScreenUtil().screenHeight(20)),
        decoration: BoxDecoration(
            color: widget.boxColor,
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor!,
                blurRadius: 1, // Shadow position
              ),
            ],
            border: Border.all(color: widget.containerBorderColor!),
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  iconAssets.heart,
                  color: widget.priceColor,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppScreenUtil().screenWidth(8),
                      AppScreenUtil().screenHeight(4),
                      AppScreenUtil().screenWidth(8),
                      AppScreenUtil().screenWidth(8)),
                  child: Image.asset(
                    widget.data!['image'].toString(),
                    height: AppScreenUtil().screenHeight(50),
                    width: AppScreenUtil().screenWidth(100),
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
                      HomeFontStyle().mulishtextLayout(
                          fontSize: 11, text: widget.data['name']),
                      const Space(0, 8),
                      HomeFontStyle().mulishtextLayout(
                          fontSize: 10,
                          color: widget.descriptionColor,
                          text: widget.data['description']),
                      const Space(0, 8),
                      HomeFontStyle().mulishtextLayout(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: widget.priceColor,
                          text: HomeFont().dollar +
                              widget.data['price'].toString()),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppScreenUtil().size(5)),
                  decoration: BoxDecoration(
                      color: widget.primaryColor,
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(5))),
                  child: Icon(
                    Icons.add,
                    color: widget.iconColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

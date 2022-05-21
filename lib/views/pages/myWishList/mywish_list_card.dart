import 'package:fast_ui/controllers/mywish_list_controller.dart';
import 'package:fast_ui/views/pages/myWishList/util/mywish_list_fontstyle.dart';
import 'package:fast_ui/views/pages/myWishList/util/mywish_list_constants.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class MyWishListCard extends StatelessWidget {
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

  const MyWishListCard({
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
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppScreenUtil().borderRadius(10)),
            bottomLeft: Radius.circular(AppScreenUtil().borderRadius(10))),
      ),
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
                MyWishListFontStyle().mulishtextLayout(
                    text: data['name'], fontSize: 13, color: titleColor),
                const Space(0, 2),
                MyWishListFontStyle().mulishtextLayout(
                    text: data['description'],
                    fontSize: 13,
                    color: descriptionColor),
                Row(
                  children: [
                    MyWishListFontStyle().mulishtextLayout(
                        text:
                            MyWishListFont().dollar + data['price'].toString(),
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
                      child: MyWishListFontStyle().mulishtextLayout(
                        text: data['discount'].toString(),
                        fontSize: 10,
                        color: discountTextColor,
                      ),
                    ),
                    const Space(40, 0),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().screenHeight(8),
                          horizontal: AppScreenUtil().screenWidth(6)),
                      decoration: BoxDecoration(
                          color: discountTextColor,
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5)),
                          border: Border.all(color: quantityBorderColor!)),
                      child: GetBuilder<MyWishListController>(
                        builder: (ctrl) => Row(
                          children: [
                            InkWell(
                                onTap: minusTap,
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                )),
                            const Space(10, 0),
                            Text(data['quantity'].toString()),
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

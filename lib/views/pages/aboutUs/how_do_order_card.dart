import 'package:fast_ui/views/pages/aboutUs/util/aboutus_constants.dart';
import 'package:fast_ui/views/pages/aboutUs/util/aboutus_fontstyle.dart';
import 'package:fast_ui/views/pages/aboutUs/util/aboutus_widget.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class HowDoOrderCard extends StatelessWidget {
  final dynamic data;
  final Color? containerColor;
  final Color? titleColor;
  final Color? darkContentColor;
  final Color? primaryColor;
  final Color? whiteColor;
  const HowDoOrderCard(
      {Key? key,
      this.data,
      this.containerColor,
      this.titleColor,
      this.darkContentColor,
      this.primaryColor,
      this.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(15),
            ),
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(30),
                right: AppScreenUtil().screenWidth(10),
                top: AppScreenUtil().screenHeight(18),
                bottom: AppScreenUtil().screenHeight(18)),
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutUsWidget()
                    .commonTitle(text: data['title'], color: titleColor),
                const Space(0, 5),
                AboutUsFontStyle().mulishtextLayout(
                    text: data['desc'],
                    overflow: TextOverflow.clip,
                    height: 1.7,
                    fontWeight: FontWeight.normal,
                    fontSize: AboutUsFontSize.textSizeSmall,
                    color: darkContentColor),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(11),
                vertical: AppScreenUtil().screenHeight(7)),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
            child: AboutUsWidget()
                .commonTitle(text: data['id'], color: whiteColor),
          ),
        ],
      ),
    );
  }
}

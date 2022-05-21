import 'package:fast_ui/views/pages/aboutUs/util/aboutus_constants.dart';
import 'package:fast_ui/views/pages/aboutUs/util/aboutus_widget.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';

class TeamListCard extends StatelessWidget {
  final dynamic data;
  final Color? lightPrimaryColor;
  final Color? titleColor;

  const TeamListCard(
      {Key? key, this.data, this.lightPrimaryColor, this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: AppScreenUtil().screenHeight(12)),
              height: AppScreenUtil().screenHeight(120),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: lightPrimaryColor, shape: BoxShape.circle),
            ),
            Image.asset(
              data['image'].toString(),
              height: AppScreenUtil().screenHeight(130),
            )
          ],
        ),
        const Space(0, 10),
        AboutUsWidget()
            .commonTitle(text: AboutUsFont().howDoOrder, color: titleColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AboutUsWidget().commonImage(image: iconAssets.facebook),
            const Space(5, 0),
            AboutUsWidget().commonImage(image: iconAssets.linkedIn),
            const Space(5, 0),
            AboutUsWidget().commonImage(image: iconAssets.twitter),
          ],
        )
      ],
    );
  }
}

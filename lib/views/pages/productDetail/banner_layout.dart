import 'package:fast_ui/utilities/app_array.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config.dart';

class BannerLayout extends StatelessWidget {
  final Color? bGcolor;
  final Color? activeDotColor;
  final Color? dotColor;
  const BannerLayout(
      {Key? key, this.bGcolor, this.activeDotColor, this.dotColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    return Container(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
      color: bGcolor,
      child: Column(
        children: [
          SizedBox(
            height: AppScreenUtil().screenHeight(240),
            child: PageView.builder(
              controller: controller,
              itemCount: AppArray().lowerPriceList.length,
              itemBuilder: (_, index) {
                return Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppArray().lowerPriceList[index]['image'].toString(),
                      width: AppScreenUtil().screenWidth(150),
                    ));
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: AppArray().lowerPriceList.length,
            effect: ExpandingDotsEffect(
              dotHeight: AppScreenUtil().screenHeight(8),
              dotWidth: AppScreenUtil().screenHeight(8),
              activeDotColor: activeDotColor!,
              dotColor: dotColor!,
              // strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }
}

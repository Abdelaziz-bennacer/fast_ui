import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_ui/config.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final GestureTapCallback? onTap;
  BannerList({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(15),
          right: AppScreenUtil().screenHeight(15)),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2,
          viewportFraction: 1,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        itemCount: AppArray().bannerList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(AppScreenUtil().borderRadius(15))),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      AppArray().bannerList[itemIndex].backgroundImage,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 15,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: AppScreenUtil().screenWidth(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeFontStyle().quicksandtextLayout(
                                text: AppArray().bannerList[itemIndex].title,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: itemIndex.isEven
                                    ? appCtrl.appTheme.bannerTitleColor
                                    : appCtrl.appTheme.white),
                            const Space(0, 5),
                            HomeFontStyle().quicksandtextLayout(
                                text: AppArray()
                                    .bannerList[itemIndex]
                                    .description,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: itemIndex.isEven
                                    ? appCtrl.appTheme.darkContentColor
                                    : appCtrl.appTheme.white),
                            const Space(0, 15),
                            InkWell(
                              onTap: onTap,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppScreenUtil().borderRadius(5)),
                                    color: itemIndex.isEven
                                        ? appCtrl.appTheme.primary
                                        : appCtrl.appTheme.white),
                                padding: EdgeInsets.symmetric(
                                    vertical: AppScreenUtil().screenHeight(5),
                                    horizontal:
                                        AppScreenUtil().screenHeight(20)),
                                child: HomeFontStyle().mulishtextLayout(
                                    text: AppArray()
                                        .bannerList[itemIndex]
                                        .buttonTitle,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: itemIndex.isEven
                                        ? appCtrl.appTheme.white
                                        : appCtrl.appTheme.primary),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}

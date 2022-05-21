import 'package:fast_ui/config.dart';
import 'package:fast_ui/controllers/home_controller.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_constants.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_fontstyle.dart';
import 'package:flutter/material.dart';

class OfferListCard extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final dynamic data;
  final GestureTapCallback? minusTap;
  final GestureTapCallback? plusTap;
  final GestureTapCallback? onTap;

  OfferListCard({Key? key, this.data, this.plusTap, this.minusTap, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: AppScreenUtil().screenHeight(10),
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(15),
            horizontal: AppScreenUtil().screenHeight(15)),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.whiteColor,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                data['image'].toString(),
                fit: BoxFit.fill,
                height: AppScreenUtil().size(45),
                width: AppScreenUtil().size(50),
              ),
              const Space(5, 0),
              VerticalDivider(
                  color: appCtrl.appTheme.contentColor.withOpacity(.5),
                  width: 5,
                  indent: 10,
                  endIndent: 10,
                  thickness: .5),
              const Space(5, 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeFontStyle().mulishtextLayout(
                      text: data['name'],
                      fontSize: 13,
                      color: appCtrl.appTheme.titleColor),
                  const Space(0, 2),
                  HomeFontStyle().mulishtextLayout(
                      text: data['description'],
                      fontSize: 13,
                      color: appCtrl.appTheme.darkContentColor),
                  Row(
                    children: [
                      HomeFontStyle().mulishtextLayout(
                          text: HomeFont().dollar + data['price'].toString(),
                          fontSize: 12,
                          color: appCtrl.appTheme.titleColor,
                          fontWeight: FontWeight.w700),
                      Container(
                        decoration: BoxDecoration(
                            color: appCtrl.appTheme.primary,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(
                            left: AppScreenUtil().screenHeight(5)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(10),
                            vertical: AppScreenUtil().screenHeight(3)),
                        child: HomeFontStyle().mulishtextLayout(
                          text: data['discount'].toString(),
                          fontSize: 10,
                          color: appCtrl.appTheme.whiteColor,
                        ),
                      ),
                      const Space(40, 0),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().screenHeight(8),
                            horizontal: AppScreenUtil().screenWidth(8)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppScreenUtil().borderRadius(5)),
                            border: Border.all(
                                color: appCtrl.appTheme.lightPrimary)),
                        child: GetBuilder<HomeController>(
                          builder: (controller) => Row(
                            children: [
                              InkWell(
                                  onTap: minusTap,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 18,
                                  )),
                              const Space(10, 0),
                              HomeFontStyle().mulishtextLayout(
                                  text: data['quantity'].toString(),
                                  fontSize: 14,
                                  color: appCtrl.appTheme.primary),
                              // Text(data['quantity'].toString()),
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
      ),
    );
  }
}

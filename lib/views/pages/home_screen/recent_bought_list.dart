import 'package:fast_ui/config.dart';
import 'package:fast_ui/views/pages/home_screen/util/home_widget.dart';
import 'package:flutter/material.dart';

class RecentBoughtList extends StatelessWidget {
  final Color? containercolor;
  final Color? bordercolor;
  final String? title;
  final Color? themeColor;
  final Color? titlecolor;
  final dynamic list;
  final Color? listcontainercolor;
  final bool? isTheme;

  const RecentBoughtList(
      {Key? key,
      this.containercolor,
      this.bordercolor,
      this.title,
      this.titlecolor,
      this.listcontainercolor,
      this.list,
      this.isTheme,
      this.themeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: themeColor,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenHeight(15),
                right: AppScreenUtil().screenHeight(20)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppScreenUtil().borderRadius(15)),
                  bottomLeft: Radius.circular(AppScreenUtil().borderRadius(15)),
                  bottomRight:
                      Radius.circular(AppScreenUtil().borderRadius(15)),
                  topRight: Radius.circular(AppScreenUtil().borderRadius(40)),
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppScreenUtil().borderRadius(15)),
                    bottomLeft:
                        Radius.circular(AppScreenUtil().borderRadius(15)),
                    bottomRight:
                        Radius.circular(AppScreenUtil().borderRadius(15)),
                    topRight: Radius.circular(AppScreenUtil().borderRadius(35)),
                  ),
                  child: Image.asset(
                    isTheme!
                        ? imageAssets.themeRecentBoughtBG
                        : imageAssets.recentBoughtBG,
                    fit: BoxFit.fill,
                    height: AppScreenUtil().screenHeight(130),
                    width: MediaQuery.of(context).size.width,
                  )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(30),
                right: AppScreenUtil().screenWidth(20),
                top: AppScreenUtil().screenHeight(18),
                bottom: AppScreenUtil().screenHeight(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //recent bought widget
                HomeWidget().recentlyBought(text: title, color: titlecolor),
                const Space(0, 20),
                SizedBox(
                  height: AppScreenUtil().screenHeight(50),
                  child: ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.toNamed(routeName.productDetail),
                        child: Container(
                          margin:
                              EdgeInsets.only(right: AppScreenUtil().size(15)),
                          padding: EdgeInsets.symmetric(
                              vertical: AppScreenUtil().size(12),
                              horizontal: AppScreenUtil().size(12)),
                          decoration: BoxDecoration(
                              color: listcontainercolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            list[index]['image'].toString(),
                            fit: BoxFit.fill,
                            height: AppScreenUtil().size(30),
                            width: AppScreenUtil().size(30),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          /* Positioned(right: 15, child: Image.asset(imageAssets.corner))*/
        ],
      ),
    );
  }
}

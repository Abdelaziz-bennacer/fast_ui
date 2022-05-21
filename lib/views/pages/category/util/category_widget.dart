import 'package:fast_ui/config.dart';
import 'package:fast_ui/utilities/app_array.dart';
import 'package:fast_ui/views/pages/category/util/category_fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget Layout
class CategoryWidget {
  //textformfield layout
  Widget textFieldLayout(
      {String? text,
      fillcolor,
      borderColor,
      hintColor,
      Widget? suffixIcon,
      Widget? prefixIcon}) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 0, horizontal: AppScreenUtil().screenWidth(20)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: fillcolor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
              fontSize: AppScreenUtil().fontSize(15),
              color: hintColor,
              fontFamily: GoogleFonts.mulish().fontFamily)),
    );
  }

  //category layout
  Widget categoryLayout({context, var listviewBGColor, child}) {
    return Container(
      width: MediaQuery.of(context).size.width /
          AppScreenUtil()
              .screenWidth(AppScreenUtil().screenActualWidth() > 377 ? 2.9 : 3),
      decoration: BoxDecoration(
          color: listviewBGColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(10)),
              bottomRight: Radius.circular(AppScreenUtil().borderRadius(10)))),
      child: child,
    );
  }

  //image banner layout
  Widget imageBgLayout(
      {context,
      var titleColor,
      var descriptionColor,
      var buttonColor,
      var buttonTextColor}) {
    return ClipRRect(
        borderRadius:
            BorderRadius.all(Radius.circular(AppScreenUtil().borderRadius(15))),
        child: Stack(
          children: <Widget>[
            Image.asset(
              AppArray().bannerList[0].backgroundImage,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryFontStyle().quicksandtextLayout(
                        text: AppArray().bannerList[0].title,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            AppScreenUtil().screenActualWidth() > 370 ? 16 : 14,
                        color: titleColor),
                    const Space(0, 5),
                    CategoryFontStyle().quicksandtextLayout(
                        text: AppArray().bannerList[0].description,
                        fontWeight: FontWeight.normal,
                        fontSize:
                            AppScreenUtil().screenActualWidth() > 370 ? 14 : 12,
                        color: descriptionColor),
                    const Space(0, 15),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5)),
                          color: buttonColor),
                      padding: EdgeInsets.symmetric(
                          vertical: AppScreenUtil().screenHeight(5),
                          horizontal: AppScreenUtil().screenHeight(20)),
                      child: CategoryFontStyle().mulishtextLayout(
                          text: AppArray().bannerList[0].buttonTitle,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: buttonTextColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  //sub category layout
  Widget subCaegoryLayout({context, child}) {
    return Container(
      margin: EdgeInsets.only(
          right: AppScreenUtil().screenWidth(15),
          left: AppScreenUtil().screenWidth(10)),
      width: MediaQuery.of(context).size.width /
          AppScreenUtil().screenWidth(
              AppScreenUtil().screenActualWidth() > 375 ? 1.5 : 1.7),
      child: child,
    );
  }

  //sub category list layout
  Widget subCategoryList({context, var boxColor, data, var textColor}) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Get.toNamed(routeName.shopScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppScreenUtil().screenHeight(10),
                    horizontal: AppScreenUtil().screenWidth(10)),
                height: AppScreenUtil().screenHeight(55),
                width: AppScreenUtil().screenWidth(70),
                decoration: BoxDecoration(
                    color: boxColor, borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  data[index]["image"].toString(),
                  height: AppScreenUtil().screenHeight(40),
                  width: AppScreenUtil().screenWidth(40),
                  fit: BoxFit.contain,
                ),
              ),
              const Space(0, 5),
              CategoryFontStyle().mulishtextLayout(
                  color: textColor,
                  text: data[index]['title'].toString(),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  overflow: TextOverflow.clip)
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / (1.4)),
      ),
    );
  }
}

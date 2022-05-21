import 'package:fast_ui/config.dart';
import 'package:fast_ui/controllers/productdetail_controller.dart';
import 'package:fast_ui/views/pages/home_screen/everyday_essential_card.dart';
import 'package:fast_ui/views/pages/productDetail/util/product_detail_constants.dart';
import 'package:fast_ui/views/pages/productDetail/util/product_detail_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Widget Layout
class ProductDetailWidget {
  //appbar leading layout
  Widget appBarLeadingLayput(
      {GestureTapCallback? onTap,
      var borderColor,
      var iconColor,
      String? image}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            width: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 370 ? 21 : 25),
            margin: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(15),
                right: AppScreenUtil().screenWidth(8)),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.arrow_back_sharp,
              size: AppScreenUtil().size(14),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }

  //expandable list view
  Widget expandableListView(
      {context,
      int? index,
      String? title,
      bool? isExpanded,
      var lightPrimary,
      var titleColor,
      VoidCallback? onPressed,
      Widget? child}) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProductDetailFontStyle().mulishtextLayout(
                    text: title,
                    fontWeight: FontWeight.normal,
                    fontSize: ProductDetailFontSize.textSizeSMedium),
                IconButton(
                    icon: Container(
                      height: AppScreenUtil().screenHeight(25),
                      width: AppScreenUtil().screenWidth(25),
                      decoration: BoxDecoration(
                        color: lightPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isExpanded!
                            ? Icons.keyboard_arrow_down
                            : Icons.arrow_forward_ios_outlined,
                        color: titleColor,
                        size: AppScreenUtil().size(isExpanded ? 18 : 13),
                      ),
                    ),
                    onPressed: onPressed),
              ],
            ),
          ),
        ),
        childExpandable(
            context: context,
            collapsedHeight: 0.0,
            expandedHeight: AppScreenUtil().screenHeight(
                AppScreenUtil().screenActualWidth() > 377 ? 72 : 82),
            expanded: isExpanded,
            child: child)
      ],
    );
  }

  // child expandable layout
  Widget childExpandable(
      {context,
      bool? expanded,
      expandedHeight = 300.0,
      collapsedHeight = 0.0,
      Widget? child}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: screenWidth,
          height: expanded! ? expandedHeight : collapsedHeight,
          child: Container(
            child: child,
            /*decoration:
            BoxDecoration(border: Border.all(width: 0.5, color: borderColor)),*/
          ),
        ),
        if (!expanded)
          const Divider(
            height: 1,
            indent: 15,
            endIndent: 15,
          )
      ],
    );
  }

  //appbar action layout
  Widget appBarActionLayout({var iconColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          bottom: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 15 : 20),
          top: AppScreenUtil().screenHeight(
              AppScreenUtil().screenActualWidth() > 370 ? 10 : 20),
          right: AppScreenUtil().screenWidth(15)),
      child: Image.asset(
        iconAssets.share,
        height: AppScreenUtil().screenHeight(20),
        fit: BoxFit.contain,
        color: iconColor,
      ),
    );
  }

  //category layout
  Widget categoryLayout({Widget? child, context, var color}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color,
      margin: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(15),
        bottom: AppScreenUtil().screenHeight(15),
      ),
      padding: EdgeInsets.only(
        top: AppScreenUtil().screenHeight(8),
        bottom: AppScreenUtil().screenHeight(8),
      ),
      height: AppScreenUtil().screenHeight(38),
      child: child,
    );
  }

  //rating layout
  Widget ratingLayout(
      {var ratingColor,
      var glowColor,
      var unratedColor,
      ValueChanged<double>? onRatingUpdate,
      double? value}) {
    return RatingBar.builder(
      itemSize: AppScreenUtil().size(20.0),
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glowColor: glowColor,
      itemPadding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(1),
          vertical: AppScreenUtil().screenHeight(5)),
      unratedColor: unratedColor,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  //price layout
  Widget priceLayout(
      {String? dicountPric,
      var discountPriceColor,
      var totalPrice,
      var totalPriceColor,
      var discountText,
      var discountTextColor}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Row(
        children: [
          ProductDetailFontStyle().mulishtextLayout(
              text: ProductDetailFont().dollar + dicountPric!,
              fontSize: ProductDetailFontSize.textSizeMedium,
              color: discountPriceColor,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.clip),
          const Space(10, 0),
          ProductDetailFontStyle().mulishtextLayout(
              text: ProductDetailFont().dollar + totalPrice,
              fontSize: ProductDetailFontSize.textSizeSMedium,
              textDecoration: TextDecoration.lineThrough,
              color: totalPriceColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.clip),
          const Space(10, 0),
          ProductDetailFontStyle().mulishtextLayout(
              text: discountText,
              fontSize: ProductDetailFontSize.textSizeSMedium,
              color: discountTextColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.clip),
        ],
      ),
    );
  }

  //common layout for select quanity and delivery time
  Widget commonLayoyt(
      {var text,
      GestureTapCallback? onTap,
      var containerColor,
      var textColor}) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(10),
                horizontal: AppScreenUtil().screenWidth(10)),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductDetailFontStyle().mulishtextLayout(
                      text: text, fontSize: 14, color: textColor),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: AppScreenUtil().size(16),
                  )
                ])));
  }

  //check icon Layout
  Widget checkIcon({var iconColor, var containerColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(3),
          vertical: AppScreenUtil().screenHeight(2)),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(2)),
              bottomLeft: Radius.circular(AppScreenUtil().borderRadius(2)))),
      child: Icon(
        Icons.check,
        size: AppScreenUtil().size(16),
        color: iconColor,
      ),
    );
  }

  //common button widget
  Widget commonButtonWidget(
      {context,
      var containerColor,
      var borderColor,
      var textColor,
      String? text,
      GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenWidth(13),
            horizontal: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          border: Border.all(
              color: borderColor, width: .5), //border of dropdown button
        ),
        child: ProductDetailFontStyle().mulishtextLayout(
            text: text,
            textAlign: TextAlign.center,
            fontSize: ProductDetailFontSize.textSizeSmall,
            color: textColor),
      ),
    );
  }

  //detail list layout
  Widget detailListLayout(
      {var data,
      context,
      var textColor,
      var dividerColor,
      bool? isShow,
      ValueChanged<bool>? onExpansionChanged}) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(5),
                right: AppScreenUtil().screenWidth(15)),
            textColor: textColor,
            collapsedTextColor: textColor,
            childrenPadding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(5), vertical: 0),
            title: ProductDetailFontStyle().mulishtextLayout(
                text: data['title'],
                fontWeight: FontWeight.normal,
                fontSize: ProductDetailFontSize.textSizeSMedium),
            trailing: Icon(
              data['isShow']
                  ? Icons.keyboard_arrow_down_outlined
                  : Icons.arrow_forward_ios_outlined,
              size: AppScreenUtil().size(16),
            ),
            onExpansionChanged: onExpansionChanged,
            children: [
              ProductDetailFontStyle().mulishtextLayout(
                  text: data['desc'],
                  fontWeight: FontWeight.normal,
                  fontSize: ProductDetailFontSize.textSizeSmall,
                  overflow: TextOverflow.clip),
            ],
          ),
          Space(
              0,
              data['isShow']
                  ? isShow!
                      ? 10
                      : 0
                  : 0),
          Divider(
            color: dividerColor,
            thickness: .5,
            indent: 5,
            endIndent: 5,
            height: 0,
          )
        ],
      ),
    );
  }

  //product review count and see All text
  Widget reviewCountAndSeeAll(
      {String? text,
      var textColor,
      String? seeAll,
      var seeAllColor,
      GestureTapCallback? onTap}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductDetailFontStyle().mulishtextLayout(
              text: text,
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w600),
          InkWell(
              onTap: onTap,
              child: ProductDetailFontStyle().mulishtextLayout(
                  text: seeAll,
                  fontSize: 12,
                  color: seeAllColor,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }

  //lowest price
  Widget lowestPrice(
      {Widget? child,
      var containerColor,
      BuildContext? context,
      bool? isBigScreen}) {
    return Container(
      color: containerColor,
      width: MediaQuery.of(context!).size.width,
      height: MediaQuery.of(context).size.height *
          (AppScreenUtil().screenActualWidth() > 377 ? 35 : 42) /
          100,
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      child: child,
    );
  }

  //common title and see all widget
  Widget commonTitleAndSeeAllWidget(
      {String? title, String? seeAllText, var seeAllColor, var textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductDetailFontStyle().mulishtextLayout(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: ProductDetailFontSize.textSizeSMedium,
            color: textColor),
        ProductDetailFontStyle().mulishtextLayout(
            text: seeAllText,
            fontSize: 12,
            color: seeAllColor,
            fontWeight: FontWeight.w700),
      ],
    );
  }

  //common description text Widget
  Widget commonDescriptionTextWidget({String? text, var color}) {
    return ProductDetailFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.normal,
        fontSize: ProductDetailFontSize.textSizeSmall,
        color: color);
  }

  //Common Horizontal list layout
  Widget commonHorizontalListLayout(
      {BuildContext? context,
      String? title,
      String? seeAllText,
      var data,
      var lowestPriceColor,
      var payLessColor,
      var containerBorderColor,
      var descriptionColor,
      var priceColor,
      var primaryColor,
      var boxColor,
      var iconColor,
      var shadowColor,
      bool? isBigScreen}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //everyday essential and see all  widget
        commonTitleAndSeeAllWidget(
            title: title,
            seeAllText: seeAllText,
            seeAllColor: lowestPriceColor),
        const Space(0, 5),
        //popular offers of the day text widget
        commonDescriptionTextWidget(
            text: ProductDetailFont().payLessGetMore, color: payLessColor),
        //lowest price list
        SizedBox(
          height: MediaQuery.of(context!).size.height *
              (AppScreenUtil().screenActualWidth() > 377 ? 27 : 30) /
              100,
          child: ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return EveryDayEssentialCard(
                  index: index,
                  boxColor: boxColor,
                  shadowColor: shadowColor,
                  data: data[index],
                  containerBorderColor: containerBorderColor,
                  descriptionColor: descriptionColor,
                  priceColor: priceColor,
                  primaryColor: primaryColor,
                  iconColor: iconColor);
            },
          ),
        )
      ],
    );
  }

  //amount button layout
  Widget amountButtonLayout(
      {context,
      var buttonColor,
      var itemColor,
      var qunatityBoxColor,
      var quantityColor,
      GestureTapCallback? minusTap,
      GestureTapCallback? plusTap,
      GestureTapCallback? onTap,
      int? quantity}) {
    return Container(
      height: AppScreenUtil().screenHeight(55),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(10)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(20),
          vertical: AppScreenUtil().screenHeight(5)),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(5),
                vertical: AppScreenUtil().screenHeight(10)),
            decoration: BoxDecoration(
                color: qunatityBoxColor,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(10))),
            child: GetBuilder<ProductDetailController>(builder: (ctrl) {
              return Row(
                children: [
                  InkWell(
                      onTap: minusTap,
                      child: Icon(CupertinoIcons.minus, color: quantityColor)),
                  const Space(15, 0),
                  ProductDetailFontStyle().mulishtextLayout(
                      text: quantity.toString(),
                      fontWeight: FontWeight.normal,
                      fontSize: ProductDetailFontSize.textSizeSMedium,
                      color: buttonColor),
                  const Space(15, 0),
                  InkWell(
                      onTap: plusTap,
                      child: Icon(Icons.add, color: quantityColor))
                ],
              );
            }),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                ProductDetailFontStyle().mulishtextLayout(
                    text: ProductDetailFont().addToCart,
                    color: itemColor,
                    fontSize: ProductDetailFontSize.textSizeSMedium),
                const Space(5, 0),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: itemColor,
                  size: AppScreenUtil().size(18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

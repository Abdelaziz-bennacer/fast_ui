import 'package:fast_ui/views/pages/category/util/category_fontstyle.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

// ignore: must_be_immutable
class CategoryData extends StatefulWidget {
  final dynamic data;
  final Color? primaryColor;
  final Color? listviewBGColor;
  final Color? selectColor;
  int? index;
  int? lastIndex;
  int? selectIndex;
  CategoryData(
      {Key? key,
      this.data,
      this.primaryColor,
      this.index,
      this.listviewBGColor,
      this.lastIndex,
      this.selectIndex,
      this.selectColor})
      : super(key: key);

  @override
  State<CategoryData> createState() => _CategoryDataState();
}

class _CategoryDataState extends State<CategoryData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.index == widget.selectIndex
            ? widget.selectColor
            : widget.listviewBGColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
                AppScreenUtil().borderRadius(widget.index == 0 ? 5 : 0)),
            bottomRight: Radius.circular(AppScreenUtil()
                .borderRadius(widget.index == widget.lastIndex ? 5 : 0))),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.data.image,
                  height: AppScreenUtil().screenHeight(40),
                  width: AppScreenUtil().screenWidth(40),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: AppScreenUtil().screenHeight(5)),
                  child: CategoryFontStyle().mulishtextLayout(
                    text: widget.data.title,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          if (widget.index != widget.lastIndex)
            Divider(
              color: widget.index == widget.selectIndex
                  ? widget.selectColor
                  : widget.primaryColor!.withOpacity(.1),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
        ],
      ),
    );
  }
}

import 'package:fast_ui/views/pages/payment/util/payment_fontstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';

class NetBankingListCard extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final Color? titleColor;
  final Color? primaryColor;
  final int? index;
  final int? selectindex;
  const NetBankingListCard(
      {Key? key,
      this.data,
      this.onTap,
      this.titleColor,
      this.index,
      this.selectindex,
      this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            selectindex == index
                ? Icons.radio_button_checked
                : CupertinoIcons.circle,
            size: AppScreenUtil().size(18),
            color: primaryColor,
          ),
          const Space(8, 0),
          PaymentFontStyle().mulishtextLayout(
              text: data['title'],
              fontSize: 9,
              color: titleColor,
              overflow: TextOverflow.clip,
              fontWeight: FontWeight.w600)
        ],
      ),
    );
  }
}

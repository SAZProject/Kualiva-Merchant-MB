import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_scroll_text.dart';

class VoucherListItem extends StatelessWidget {
  const VoucherListItem({
    super.key,
    required this.voucherTitle,
    required this.voucherPrice,
    required this.voucherQuota,
    required this.voucherLimit,
  });

  final String voucherTitle;
  final String voucherPrice;
  final String voucherQuota;
  final String voucherLimit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 2.5.h),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: CustomDecoration(context).outlinePrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucherTitle,
                  style: CustomTextStyles(context).bodySmallPrimary12.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                CustomScrollText(
                  key: ValueKey("$voucherPrice-$voucherQuota-$voucherLimit"),
                  text: "$voucherPrice - $voucherQuota - $voucherLimit",
                  style:
                      CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
                  height: 15.h,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30.h,
            height: 30.h,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 15.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/program/widget/locked_content.dart';
import 'package:kualiva_merchant_mb/program/widget/voucher_list_item.dart';

class VoucherProgramFeature extends StatelessWidget {
  const VoucherProgramFeature({super.key, required this.voucherLockedNotifier});

  final ValueNotifier<bool> voucherLockedNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: voucherLockedNotifier,
        builder: (context, value, child) {
          return SizedBox(
            width: 320.h,
            child: LockedContent(
              onTap: () => voucherLockedNotifier.value = !value,
              isLocked: value,
              child: Card(
                elevation: 5.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.tr("program_screen.voucher_system"),
                        style: theme(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10.h),
                      _buildVoucherDisplay(context),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildVoucherDisplay(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr("program_screen.voucher_active"),
            style: CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 200.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemExtent: 50.h,
              itemBuilder: (context, index) {
                return VoucherListItem(
                  voucherTitle: "Free ${Faker().food.dish()}",
                  voucherPrice: context.tr(
                    "program_screen.voucher_price",
                    namedArgs: {
                      "price": NumberFormat('#,###', 'id_ID')
                          .format((Random().nextDouble() * 150000)),
                    },
                  ),
                  voucherQuota: context.tr(
                    "program_screen.voucher_quota",
                    namedArgs: {
                      "quota": Random().nextInt(100).toString(),
                    },
                  ),
                  voucherLimit: context.tr(
                    "program_screen.voucher_limit",
                    namedArgs: {
                      "limit": Random().nextInt(10).toString(),
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

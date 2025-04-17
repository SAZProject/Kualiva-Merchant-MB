import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/utility/datetime_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/program/widget/locked_content.dart';
import 'package:kualiva_merchant_mb/program/widget/reward_point_history_item.dart';

class RewardProgramFeature extends StatelessWidget {
  const RewardProgramFeature({super.key, required this.rewardLockedNotifier});

  final ValueNotifier<bool> rewardLockedNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: rewardLockedNotifier,
        builder: (context, value, child) {
          return SizedBox(
            width: 320.h,
            child: LockedContent(
              onTap: () => rewardLockedNotifier.value = !value,
              isLocked: value,
              child: Card(
                elevation: 5.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPointDisplay(context),
                      Divider(
                        thickness: 0.5.h,
                        height: 10.h,
                        indent: 10.h,
                        endIndent: 10.h,
                      ),
                      _buildPointHistory(context),
                      SizedBox(height: 10.h),
                      _buildLoadMoreBtn(context),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildPointDisplay(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.tr("program_screen.reward_total"),
                style: CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                NumberFormat('#,###', 'id_ID')
                    .format((Random().nextDouble() * 200000)),
                style: theme(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.h,
                height: 50.h,
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(
                      context, AppRoutes.rewardProgramScreen),
                  icon: Icon(
                    Icons.currency_exchange,
                    size: 20.h,
                    color: theme(context).colorScheme.primary,
                  ),
                  style: CustomButtonStyles.fillprimary_025(context),
                ),
              ),
              Text(
                context.tr("program_screen.reward_exchange"),
                style: CustomTextStyles(context).bodySmallPrimary12,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPointHistory(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemExtent: 30.h,
      itemBuilder: (context, index) {
        return RewardPointHistoryItem(
          point: NumberFormat('#,###', 'id_ID')
              .format((Random().nextDouble() * 200000)),
          date: DatetimeUtils.dmy(
              Faker().date.dateTime(minYear: 2024, maxYear: 2025)),
        );
      },
    );
  }

  Widget _buildLoadMoreBtn(BuildContext context) {
    return CustomElevatedButton(
      initialText: context.tr("program_screen.reward_load_more"),
      height: 30.h,
      decoration: null,
      buttonStyle: CustomButtonStyles.fillprimary_025(context),
      buttonTextStyle: CustomTextStyles(context).bodySmallPrimary12.copyWith(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
    );
  }
}

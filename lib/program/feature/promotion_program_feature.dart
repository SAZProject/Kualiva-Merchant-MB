import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/program/widget/locked_content.dart';

class PromotionProgramFeature extends StatelessWidget {
  const PromotionProgramFeature(
      {super.key, required this.promotionLockedNotifier});

  final ValueNotifier<bool> promotionLockedNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: promotionLockedNotifier,
        builder: (context, value, child) {
          return SizedBox(
            width: 320.h,
            child: LockedContent(
              onTap: () => promotionLockedNotifier.value = !value,
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
                        context.tr("program_screen.ad_system"),
                        style: theme(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10.h),
                      _buildPromotionDisplay(context),
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

  Widget _buildPromotionDisplay(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr("program_screen.ad_tier_label"),
                style: CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                context.tr("program_screen.ad_tier_current",
                    namedArgs: {"tier": (Random().nextInt(3) + 1).toString()}),
                style: theme(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
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

  Widget _buildLoadMoreBtn(BuildContext context) {
    return CustomElevatedButton(
      initialText: context.tr("program_screen.ad_edit_tier"),
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

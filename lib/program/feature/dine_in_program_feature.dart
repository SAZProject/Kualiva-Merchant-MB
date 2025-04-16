import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/program/widget/locked_content.dart';

class DineInProgramFeature extends StatelessWidget {
  const DineInProgramFeature({
    super.key,
    required this.dineInLockedNotifier,
    required this.isSystemActiveNotif,
  });

  final ValueNotifier<bool> dineInLockedNotifier;
  final ValueNotifier<bool> isSystemActiveNotif;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dineInLockedNotifier,
        builder: (context, value, child) {
          return SizedBox(
            width: 320.h,
            child: LockedContent(
              onTap: () => dineInLockedNotifier.value = !value,
              isLocked: value,
              child: Card(
                elevation: 2.h,
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
                      _buildAdTierDisplay(context),
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

  Widget _buildAdTierDisplay(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSystemActiveNotif,
      builder: (context, value, child) {
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
                    context.tr("program_screen.dine_in_status"),
                    style: CustomTextStyles(context)
                        .bodySmallOnPrimaryContainer_06,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    value
                        ? context.tr("program_screen.dine_in_active")
                        : context.tr("program_screen.dine_in_inactive"),
                    style: value
                        ? CustomTextStyles(context).titleMediumPrimary
                        : theme(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                width: 30.h,
                height: 30.h,
                child: Switch(
                  value: value,
                  activeTrackColor:
                      theme(context).colorScheme.onSecondaryContainer,
                  trackOutlineColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return theme(context).colorScheme.primary;
                      }
                      return theme(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withValues(alpha: 0.6);
                    },
                  ),
                  inactiveThumbColor: theme(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withValues(alpha: 0.6),
                  activeColor: theme(context).colorScheme.primary,
                  onChanged: (val) {
                    isSystemActiveNotif.value = val;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadMoreBtn(BuildContext context) {
    return CustomElevatedButton(
      initialText: context.tr("program_screen.dine_in_view_tac"),
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

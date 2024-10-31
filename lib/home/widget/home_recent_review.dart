import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_section_header.dart';
import 'package:kualiva_merchant_mb/home/widget/recent_review_item.dart';

class HomeRecentReview extends StatelessWidget {
  const HomeRecentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          CustomSectionHeader(
            label: context.tr("home_screen.review"),
            useIcon: false,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.h),
              child: Text(
                context.tr("home_screen.recent"),
                style:
                    CustomTextStyles(context).bodyMediumOnPrimaryContainer_06,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _buildlistReview(context),
          _viewMore(context),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget _buildlistReview(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemExtent: 50.h,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const RecentReviewItem();
      },
    );
  }

  Widget _viewMore(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 5.h),
      child: CustomElevatedButton(
        initialText: context.tr("home_screen.view_more"),
        height: 40.h,
        buttonStyle: CustomButtonStyles.fillOnSecondaryContainer(context),
        buttonTextStyle: TextStyle(
            color: theme(context).colorScheme.onPrimaryContainer,
            decoration: TextDecoration.underline),
      ),
    );
  }
}

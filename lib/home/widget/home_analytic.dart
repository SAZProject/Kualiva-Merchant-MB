import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_section_header.dart';

class HomeAnalytic extends StatelessWidget {
  const HomeAnalytic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          CustomSectionHeader(
            label: context.tr("home_screen.analytic"),
            useIcon: false,
          ),
          _buildAnalytic(context),
        ],
      ),
    );
  }

  Widget _buildAnalytic(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _analyticItem(
          context,
          context.tr("home_screen.turnover_price",
              namedArgs: {"price": Random().nextInt(5000000).toString()}),
          context.tr("home_screen.turnover_percentage",
              namedArgs: {"percentage": Random().nextInt(100).toString()}),
          context.tr("home_screen.total_turnover"),
        ),
        _analyticItem(
          context,
          Random().nextInt(500).toString(),
          context.tr("home_screen.customer_percentage",
              namedArgs: {"percentage": Random().nextInt(100).toString()}),
          context.tr("home_screen.total_customer"),
        ),
      ],
    );
  }

  Widget _analyticItem(
      BuildContext context, String value, String percentage, String label) {
    return SizedBox(
      width: 150.h,
      height: 100.h,
      child: Column(
        children: [
          Text(
            value,
            style: theme(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            percentage,
            style: theme(context).textTheme.bodySmall!.copyWith(
                  color: appTheme.gray600,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            label,
            style: theme(context).textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

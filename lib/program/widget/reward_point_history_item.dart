import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class RewardPointHistoryItem extends StatelessWidget {
  const RewardPointHistoryItem(
      {super.key, required this.point, required this.date});

  final String point;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.tr("program_screen.reward_increment",
              namedArgs: {"point": point}),
          style: CustomTextStyles(context).bodySmall12,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          date,
          style: CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}

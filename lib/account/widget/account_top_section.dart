import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class AccountTopSection extends StatelessWidget {
  const AccountTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          _buildSectionItem(
            context,
            Icons.edit,
            context.tr("account.edit_data"),
            () {},
          ),
          _buildSectionItem(
            context,
            Icons.language,
            context.tr("account.web_dashboard"),
            () {},
          )
        ],
      ),
    );
  }

  Widget _buildSectionItem(
    BuildContext context,
    IconData icon,
    String label,
    Function()? onPressed,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: double.maxFinite,
          child: Card(
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30.h,
                  ),
                  Text(
                    label,
                    style: theme(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

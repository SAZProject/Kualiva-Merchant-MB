import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:flutter/material.dart';

class CustomExpandableListItem extends StatelessWidget {
  const CustomExpandableListItem({
    super.key,
    required this.itemLabel,
    required this.itemContent,
  });

  final String itemLabel;
  final String itemContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
      child: Card(
        elevation: 5.0,
        color: theme(context).colorScheme.onSecondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
          dense: true,
          backgroundColor: theme(context).colorScheme.onSecondaryContainer,
          shape: Border.all(color: Colors.transparent),
          title: Padding(
            padding: EdgeInsets.all(10.h),
            child: Text(
              itemLabel,
              style: theme(context).textTheme.labelLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Text(
                itemContent,
                style: theme(context).textTheme.bodySmall,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

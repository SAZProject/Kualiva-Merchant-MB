import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';

class ProgramAppBarFeature extends StatelessWidget
    implements PreferredSizeWidget {
  const ProgramAppBarFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      customTitle: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("common.appbar", namedArgs: {
                "name": Faker().person.name(),
                "userId": Faker().internet.macAddress().replaceAll(":", "")
              }),
              style: CustomTextStyles(context).bodySmallOnSecondaryContainer,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              Faker().company.name(),
              style: CustomTextStyles(context)
                  .bodySmallOnSecondaryContainer
                  .copyWith(fontSize: 12.h),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
      leadingIcon: Icons.switch_account,
      leadingIconColor: theme(context).colorScheme.onSecondaryContainer,
      onBackPressed: () {},
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.h),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25.h,
              color: theme(context).colorScheme.onSecondaryContainer,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.h);
}

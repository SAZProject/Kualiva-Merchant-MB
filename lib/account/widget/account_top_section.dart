import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class AccountTopSection extends StatelessWidget {
  const AccountTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: _userLevel(context),
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
            elevation: 2.h,
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

  Widget _userLevel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.h,
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: Card(
          color: theme(context).colorScheme.onSecondaryContainer,
          margin: EdgeInsets.zero,
          elevation: 2.h,
          child: InkWell(
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.editOwnershipScreen),
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImageView(
                    imagePath: Faker().image.loremPicsum(),
                    width: 50.h,
                    height: 50.h,
                    radius: BorderRadiusStyle.roundedBorder50,
                    boxFit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr("account.merchant_acc"),
                          style: CustomTextStyles(context).bodySmallPrimary12,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          Faker().person.name(),
                          style: theme(context).textTheme.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 20.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';

class RecentReviewItem extends StatelessWidget {
  const RecentReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageView(
              imagePath:
                  Faker().image.loremPicsum(random: Random().nextInt(300)),
              width: 30.h,
              height: 30.h,
              boxFit: BoxFit.cover,
              radius: BorderRadiusStyle.roundedBorder50,
            ),
            SizedBox(width: 5.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Faker().person.name(),
                    style: CustomTextStyles(context).bodySmall12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    Faker().lorem.sentence(),
                    style: CustomTextStyles(context).bodySmall10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15.h,
                  color: theme(context).colorScheme.primary,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    (Random().nextDouble() * 5.0).ceil().toString(),
                    style: CustomTextStyles(context).bodySmall10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

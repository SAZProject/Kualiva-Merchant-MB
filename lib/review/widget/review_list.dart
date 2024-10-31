import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/datetime_utils.dart';
import 'package:kualiva_merchant_mb/review/widget/review_list_item.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ReviewListItem(
            index: index.toString(),
            imagePath: Faker().image.loremPicsum(random: Random().nextInt(300)),
            username: Faker().person.name(),
            reviewContent: Faker().lorem.sentence(),
            publishDate: DatetimeUtils.dmy(Faker().date.dateTime()),
            ratingScore: (Random().nextDouble() * 5.0).ceil().toString(),
          );
        },
      ),
    );
  }
}

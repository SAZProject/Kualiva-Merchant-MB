import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/review/widget/review_filters.dart';
import 'package:kualiva_merchant_mb/review/widget/review_list.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _reviewAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _reviewAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("common.appbar",
          namedArgs: {"name": "name", "userId": "User Id"}),
      leadingIcon: Icons.switch_account,
      onBackPressed: () {},
    );
  }

  Widget _body(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReviewFilters(),
            ReviewList(),
          ],
        ),
      ),
    );
  }
}

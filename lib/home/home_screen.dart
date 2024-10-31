import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/home/widget/home_analytic.dart';
import 'package:kualiva_merchant_mb/home/widget/home_programs_slider.dart';
import 'package:kualiva_merchant_mb/home/widget/home_recent_review.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _rewardAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _rewardAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("common.appbar",
          namedArgs: {"name": "name", "userId": "User Id"}),
      leadingIcon: Icons.switch_account,
      onBackPressed: () {},
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.h),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25.h,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeProgramsSlider(),
            const HomeAnalytic(),
            const HomeRecentReview(),
          ],
        ),
      ),
    );
  }
}

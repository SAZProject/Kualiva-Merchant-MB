import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/feature/search_bar/search_bar_feature.dart';
import 'package:kualiva_merchant_mb/review/feature/review_app_bar_feature.dart';
import 'package:kualiva_merchant_mb/review/widget/review_list.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ReviewAppBarFeature(),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarFeature(isSliverSearchBar: false),
            ReviewList(),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/feature/search_bar/my_fixed_search_bar_widget.dart';
import 'package:kualiva_merchant_mb/common/feature/search_bar/my_sliver_search_bar_widget.dart';
import 'package:kualiva_merchant_mb/common/screen/widget/search_list_item.dart';
import 'package:kualiva_merchant_mb/common/screen/widget/search_media_item.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_section_header.dart';

class SearchBarFeature extends StatelessWidget {
  const SearchBarFeature({
    super.key,
    this.isSliverSearchBar = true,
  });

  final bool isSliverSearchBar;

  @override
  Widget build(BuildContext context) {
    final List<Widget> listSearchSuggest = [
      SizedBox(height: 5.h),
      _buildMediaList(),
      SizedBox(height: 5.h),
      _buildTrendList(context),
      SizedBox(height: 5.h),
      _buildRecentList(context),
      SizedBox(height: 5.h),
    ];

    if (isSliverSearchBar) {
      return MySliverSearchBarWidget(
        viewOnSubmitted: (value) {},
        suggestionsBuilder: (context, searchController) async {
          return listSearchSuggest;
        },
      );
    }

    return MyFixedSearchBarWidget(
      viewOnSubmitted: (value) {},
      suggestionsBuilder: (context, searchController) async {
        return listSearchSuggest;
      },
    );
  }

  Widget _buildMediaList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: SizedBox(
            height: 150.h,
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                //TODO add waiting, empty, error state in future
                return SearchMediaItem(
                  image:
                      Faker().image.loremPicsum(random: Random().nextInt(300)),
                  label: Faker().food.dish(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrendList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeader(
            label: context.tr("search.trending"),
            useIcon: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  //TODO add waiting, empty, error state in future
                  return SearchListItem(
                    prefixIcon: Icons.trending_up,
                    label: Faker().food.dish(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSectionHeader(
            label: context.tr("search.recent"),
            useIcon: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SearchListItem(
                    prefixIcon: Icons.access_time_filled,
                    suffixIcon: Icons.arrow_outward,
                    label: Faker().food.dish(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

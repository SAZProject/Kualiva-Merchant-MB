import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_expandable_list_item.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_section_header.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  static const List<String> _helpListItem = [
    "help_screen.default_option",
    "help_screen.default_option",
    "help_screen.default_option",
    "help_screen.default_option",
    "help_screen.contact_cc",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _helpAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _helpAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("help_screen.title"),
      leadingIcon: Icons.arrow_back_ios_new,
      centerTitle: true,
      onBackPressed: () => Navigator.pop(context),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSectionHeader(
              label: context.tr("help_screen.faq"),
              useIcon: false,
            ),
            SizedBox(height: 10.h),
            _buildHelpOptionList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpOptionList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: _helpListItem.length,
      itemBuilder: (context, index) {
        return CustomExpandableListItem(
            itemLabel: context
                .tr(_helpListItem[index], namedArgs: {"index": "$index"}),
            itemContent: Faker()
                .lorem
                .sentences(5)
                .toString()
                .replaceAll(RegExp(r'[\[\],.]'), ""));
      },
    );
  }
}

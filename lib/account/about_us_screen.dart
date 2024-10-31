import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_expandable_list_item.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  static const List<String> _aboutUsListItem = [
    "about_us_screen.tac",
    "about_us_screen.privacy_policy",
    "about_us_screen.our_socials",
  ];

  void _showLicensePage({
    required BuildContext context,
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
    bool useRootNavigator = false,
  }) {
    Navigator.of(context, rootNavigator: useRootNavigator)
        .push(MaterialPageRoute<void>(
      builder: (BuildContext context) => LicensePage(
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon: applicationIcon,
        applicationLegalese: applicationLegalese,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _aboutUsAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _aboutUsAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("about_us_screen.title"),
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
            SizedBox(height: 10.h),
            _buildShowLicenseBtn(context),
            _buildAboutUsOptionList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildShowLicenseBtn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: CustomElevatedButton(
        initialText: context.tr("common.show_license"),
        onPressed: () => _showLicensePage(context: context),
      ),
    );
  }

  Widget _buildAboutUsOptionList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: _aboutUsListItem.length,
      itemBuilder: (context, index) {
        return CustomExpandableListItem(
            itemLabel: context
                .tr(_aboutUsListItem[index], namedArgs: {"index": "$index"}),
            itemContent: Faker()
                .lorem
                .sentences(5)
                .toString()
                .replaceAll(RegExp(r'[\[\],.]'), ""));
      },
    );
  }
}

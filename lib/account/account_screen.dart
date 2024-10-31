import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/account/widget/account_menu_section.dart';
import 'package:kualiva_merchant_mb/account/widget/account_top_section.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AccountTopSection(),
            AccountMenuSection(),
          ],
        ),
      ),
    );
  }
}

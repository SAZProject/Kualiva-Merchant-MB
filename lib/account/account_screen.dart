import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/account/feature/account_app_bar_feature.dart';
import 'package:kualiva_merchant_mb/account/widget/account_menu_section.dart';
import 'package:kualiva_merchant_mb/account/widget/account_top_section.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_outlined_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AccountAppBarFeature(),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AccountTopSection(),
            _buildEditOutletBtn(context),
            AccountMenuSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditOutletBtn(BuildContext context) {
    return CustomOutlinedButton(
      margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
      height: 40.h,
      text: context.tr("account.edit_outlet"),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 10.h),
        child: Icon(
          Icons.edit_location_alt_outlined,
          size: 20.h,
          color: theme(context).colorScheme.onSecondaryContainer,
        ),
      ),
      decoration: null,
      buttonStyle: CustomButtonStyles.fillprimary(context),
      buttonTextStyle: theme(context).textTheme.bodyMedium!.copyWith(
            color: theme(context).colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
          ),
      onPressed: () =>
          Navigator.pushNamed(context, AppRoutes.chooseOutletScreen),
    );
  }
}

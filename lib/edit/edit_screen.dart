import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _editAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _editAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("edit_screen.title"),
      centerTitle: true,
      leadingIcon: Icons.arrow_back_ios_new,
      onBackPressed: () => Navigator.pop(context),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.h),
          child: IconButton(
            icon: Icon(
              Icons.search,
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
            _buildEditDataItem(
              context,
              0,
              context.tr("edit_screen.edit_outlet"),
              context.tr("edit_screen.edit_outlet_content"),
              () {},
            ),
            _buildEditDataItem(
              context,
              1,
              context.tr("edit_screen.edit_user"),
              context.tr("edit_screen.edit_user_content"),
              () => Navigator.pushNamed(context, AppRoutes.editOwnershipScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditDataItem(
    BuildContext context,
    int index,
    String title,
    String subTitle,
    Function()? onPressed,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.5.h),
      child: SizedBox(
        width: double.maxFinite,
        child: ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          title: Text(
            title,
            style: CustomTextStyles(context)
                .bodyMedium_15
                .copyWith(color: theme(context).colorScheme.onPrimaryContainer),
          ),
          subtitle: Text(
            subTitle,
            style: CustomTextStyles(context)
                .bodyMedium_15
                .copyWith(color: theme(context).colorScheme.onPrimaryContainer),
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}

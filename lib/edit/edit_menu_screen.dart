import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/edit/widget/edit_menu_list_item.dart';

class EditMenuScreen extends StatelessWidget {
  const EditMenuScreen({super.key, required this.listMenuPicture});

  final List<String> listMenuPicture;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _editMenuAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _editMenuAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("edit_menu.title"),
      centerTitle: true,
      leadingIcon: Icons.arrow_back_ios_new,
      onBackPressed: () => Navigator.pop(context),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.h),
          child: IconButton(
            icon: Icon(
              Icons.add,
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
      height: MediaQuery.of(context).size.height,
      child: _buildListMenu(context),
    );
  }

  Widget _buildListMenu(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: listMenuPicture.length,
      itemBuilder: (context, index) {
        return EditMenuListItem(
          imagePath: listMenuPicture[index],
          menuTitle: Faker().food.dish(),
          menuDesc: Faker().lorem.sentence(),
          menuPrice: Random().nextInt(10000).toString(),
        );
      },
    );
  }
}

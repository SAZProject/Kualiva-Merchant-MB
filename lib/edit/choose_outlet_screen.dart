import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/dataset/outlet_dataset.dart';
import 'package:kualiva_merchant_mb/common/utility/datetime_utils.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/data/models/outlet_model.dart';
import 'package:kualiva_merchant_mb/edit/widget/choose_outlet_list_item.dart';

class ChooseOutletScreen extends StatelessWidget {
  const ChooseOutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _outletAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _outletAppBar(BuildContext context) {
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
      height: MediaQuery.of(context).size.height,
      child: _buildListOutlet(context),
    );
  }

  Widget _buildListOutlet(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChooseOutletListItem(
          outletModel: OutletModel(
            outletName: Faker().company.name(),
            uniqueId: Random().nextInt(500).toString(),
            claimedDate: DatetimeUtils.dmy(Faker().date.dateTime()),
            contact: Faker().phoneNumber.us().toString(),
            location: Faker().address.streetAddress().toString(),
            tags: OutletDataset.outletTags,
            operationalDay: List.generate(7, (index) => index),
            operationalTimeOpen: List.generate(
                7, (index) => const TimeOfDay(hour: 0, minute: 0)),
            operationalTimeClose: List.generate(
                7, (index) => const TimeOfDay(hour: 0, minute: 0)),
            menuPicture: List.generate(
                5,
                (index) =>
                    Faker().image.loremPicsum(random: Random().nextInt(300))),
          ),
        );
      },
    );
  }
}

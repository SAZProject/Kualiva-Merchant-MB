import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_text_form_field.dart';

class RewardProgramScreen extends StatelessWidget {
  RewardProgramScreen({super.key});

  final _pointExchangeCtl = TextEditingController();
  final FocusNode _pointExchangeFocus = FocusNode();

  final List<String> _listNotices = const [
    "reward_program.notice_1",
    "reward_program.notice_2",
    "reward_program.notice_3",
    "reward_program.notice_4",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _pointExchangeAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _pointExchangeAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("reward_program.title"),
      centerTitle: true,
      leadingIcon: Icons.arrow_back_ios_new,
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
            _pointExchangeTextField(context),
            SizedBox(height: 30.h),
            _pointExchangeNotice(context, listNotices: _listNotices),
          ],
        ),
      ),
    );
  }

  Widget _pointExchangeTextField(BuildContext context) {
    String maxPoints =
        NumberFormat('#,###', 'id_ID').format((Random().nextDouble() * 200000));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr("reward_program.withdraw_amount"),
            style: CustomTextStyles(context).bodySmallOnPrimaryContainer,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          CustomTextFormField(
            focusNode: _pointExchangeFocus,
            controller: _pointExchangeCtl,
            hintStyle: CustomTextStyles(context).bodySmall12,
            hintText: context.tr("reward_program.withdraw_hint"),
            textInputType: const TextInputType.numberWithOptions(),
            suffix: Padding(
              padding: EdgeInsets.only(right: 5.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35.h,
                    child: VerticalDivider(
                      thickness: 0.5.h,
                    ),
                  ),
                  CustomElevatedButton(
                    initialText: context.tr("reward_program.max"),
                    width: 50.h,
                    buttonStyle:
                        CustomButtonStyles.fillOnSecondaryContainer(context),
                    onPressed: () {
                      _pointExchangeCtl.text = maxPoints;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.tr("reward_program.max_point"),
                  style:
                      CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
                ),
                TextSpan(
                  text: maxPoints,
                  style: CustomTextStyles(context).bodySmallPrimary12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pointExchangeNotice(
    BuildContext context, {
    required List<String> listNotices,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          context.tr("reward_program.notice"),
          style: CustomTextStyles(context).bodySmallOnPrimaryContainer,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 5.h),
        ...List.generate(
          listNotices.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15.h,
                    child: Text(
                      "${index + 1}.",
                      style: CustomTextStyles(context)
                          .bodySmallOnPrimaryContainer_06
                          .copyWith(fontSize: 10.h),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      context.tr(listNotices[index]),
                      softWrap: true,
                      style: CustomTextStyles(context)
                          .bodySmallOnPrimaryContainer_06
                          .copyWith(fontSize: 10.h),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}

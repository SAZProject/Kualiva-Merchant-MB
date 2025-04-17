import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/program/feature/dine_in_program_feature.dart';
import 'package:kualiva_merchant_mb/program/feature/program_app_bar_feature.dart';
import 'package:kualiva_merchant_mb/program/feature/promotion_program_feature.dart';
import 'package:kualiva_merchant_mb/program/feature/reward_program_feature.dart';
import 'package:kualiva_merchant_mb/program/feature/voucher_program_feature.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  final _rewardLockedNotifier = ValueNotifier<bool>(true);
  final _promotionLockedNotifier = ValueNotifier<bool>(true);
  final _voucherLockedNotifier = ValueNotifier<bool>(true);
  final _dineInLockedNotifier = ValueNotifier<bool>(true);
  final _dineInSystemActivatedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _rewardLockedNotifier.dispose();
    _promotionLockedNotifier.dispose();
    _voucherLockedNotifier.dispose();
    _dineInLockedNotifier.dispose();
    _dineInSystemActivatedNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _dineInSystemActivatedNotifier.value = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: CustomDecoration(context).bgHalfCirclePrimary,
                height: 250.h,
              ),
            ),
            Column(
              children: [
                const ProgramAppBarFeature(),
                SizedBox(height: 10.h),
                RewardProgramFeature(
                    rewardLockedNotifier: _rewardLockedNotifier),
                SizedBox(height: 10.h),
                PromotionProgramFeature(
                    promotionLockedNotifier: _promotionLockedNotifier),
                SizedBox(height: 10.h),
                VoucherProgramFeature(
                    voucherLockedNotifier: _voucherLockedNotifier),
                SizedBox(height: 10.h),
                DineInProgramFeature(
                  dineInLockedNotifier: _dineInLockedNotifier,
                  isSystemActiveNotif: _dineInSystemActivatedNotifier,
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/dataset/dine_in_reservation_dataset.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_outlined_button.dart';
import 'package:kualiva_merchant_mb/program/model/dine_in_reservation_model.dart';
import 'package:kualiva_merchant_mb/program/widget/dine_in_program_reservation_item.dart';

class DineInProgramScreen extends StatefulWidget {
  const DineInProgramScreen({super.key, required this.isSystemActiveNotif});

  final ValueNotifier<bool> isSystemActiveNotif;

  @override
  State<DineInProgramScreen> createState() => _DineInProgramScreenState();
}

class _DineInProgramScreenState extends State<DineInProgramScreen> {
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
      title: context.tr("dine_in_program.title"),
      centerTitle: true,
      leadingIcon: Icons.arrow_back_ios_new,
      onBackPressed: () => Navigator.pop(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: SizedBox(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAdTierDisplay(context),
              SizedBox(height: 20.h),
              _buildListReservation(
                context,
                context.tr("dine_in_program.incoming_reservation"),
                DineInReservationDataset().listIncomingReservation,
              ),
              SizedBox(height: 10.h),
              _buildListReservation(
                context,
                context.tr("dine_in_program.pending_reservation"),
                DineInReservationDataset().listPendingReservation,
              ),
              SizedBox(height: 10.h),
              _buildListReservation(
                context,
                context.tr("dine_in_program.ongoing_reservation"),
                DineInReservationDataset().listOngoingReservation,
              ),
              SizedBox(height: 50.h),
              _buildCheckNP(context),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdTierDisplay(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: ValueListenableBuilder(
        valueListenable: widget.isSystemActiveNotif,
        builder: (context, value, child) {
          return SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr("dine_in_program.current_status"),
                      style: CustomTextStyles(context)
                          .bodySmallOnPrimaryContainer_06,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      value
                          ? context.tr("dine_in_program.active")
                          : context.tr("dine_in_program.inactive"),
                      style: value
                          ? CustomTextStyles(context).titleMediumPrimary
                          : theme(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.h,
                  height: 30.h,
                  child: Switch(
                    value: value,
                    activeTrackColor:
                        theme(context).colorScheme.onSecondaryContainer,
                    trackOutlineColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return theme(context).colorScheme.primary;
                        }
                        return theme(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withValues(alpha: 0.6);
                      },
                    ),
                    inactiveThumbColor: theme(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withValues(alpha: 0.6),
                    activeColor: theme(context).colorScheme.primary,
                    onChanged: (val) {
                      widget.isSystemActiveNotif.value = val;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListReservation(
    BuildContext context,
    String headerLabel,
    List<DineInReservationModel> listReservation,
  ) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerLabel,
            style: CustomTextStyles(context).bodySmall10,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listReservation.length,
              itemExtent: 50.h,
              itemBuilder: (context, index) {
                return DineInProgramReservationItem(
                  dineInReservationModel: listReservation[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckNP(BuildContext context) {
    return CustomOutlinedButton(
      text: context.tr("dine_in_program.check_notice_penalties_btn"),
      buttonStyle: CustomButtonStyles.outlinePrimary(context).copyWith(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder50,
        )),
      ),
      buttonTextStyle: CustomTextStyles(context).titleMediumPrimary,
    );
  }
}

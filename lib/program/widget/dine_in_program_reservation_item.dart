import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_scroll_text.dart';
import 'package:kualiva_merchant_mb/program/model/dine_in_reservation_model.dart';

class DineInProgramReservationItem extends StatelessWidget {
  const DineInProgramReservationItem({
    super.key,
    required this.dineInReservationModel,
  });

  final DineInReservationModel dineInReservationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 2.5.h),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: dineInReservationModel.incomingReservationItem
          ? CustomDecoration(context).outlinePrimary
          : CustomDecoration(context).outlineOnPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dineInReservationModel.reservationCode,
                  style: CustomTextStyles(context).bodySmallPrimary12.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                CustomScrollText(
                  key: ValueKey(dineInReservationModel.reservationContent),
                  text: context.tr(
                    dineInReservationModel.reservationContent,
                    namedArgs: {
                      "user": Faker().person.name(),
                      "personQty": Random().nextInt(10).toString(),
                      "menuQty": Random().nextInt(10).toString(),
                    },
                  ),
                  style:
                      CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
                  height: 15.h,
                ),
              ],
            ),
          ),
          dineInReservationModel.incomingReservationItem
              ? Row(
                  children: [
                    SizedBox(
                      width: 30.h,
                      height: 30.h,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          size: 20.h,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.h,
                      height: 30.h,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.done,
                          size: 20.h,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Text(
                      context.tr(
                        dineInReservationModel.pendingReservationTime ??
                            dineInReservationModel.ongoingReservationTime ??
                            "",
                        namedArgs: dineInReservationModel
                                    .pendingReservationTime !=
                                null
                            ? {
                                "index": (Random().nextInt(59) + 1).toString(),
                                "clock": [
                                  "Hour",
                                  "Minute"
                                ][Random().nextInt(1)],
                              }
                            : null,
                      ),
                      style: CustomTextStyles(context).bodySmall10,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: 30.h,
                      height: 30.h,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.h,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

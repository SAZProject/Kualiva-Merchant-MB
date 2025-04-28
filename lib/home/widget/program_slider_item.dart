import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/_data/models/ui_model/merchant_program_model.dart';

class ProgramSliderItem extends StatelessWidget {
  const ProgramSliderItem({
    super.key,
    required this.scrollIndex,
    required this.merchantProgram,
  });

  final int scrollIndex;
  final MerchantProgramModel merchantProgram;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.h,
      decoration: BoxDecoration(
        color: theme(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.amber700,
            blurRadius: 5.h,
            spreadRadius: 5.h,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                merchantProgram.programIcon,
                size: 50.h,
              ),
              Text(
                merchantProgram.programTitle,
                style: theme(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Visibility(
            visible: merchantProgram.isActive,
            child: SizedBox(
              width: double.maxFinite,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.lock,
                        size: 50.h,
                      ),
                      Text(
                        "LOCKED",
                        style: theme(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

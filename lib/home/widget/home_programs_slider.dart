import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/data/models/ui_model/merchant_program_model.dart';
import 'package:kualiva_merchant_mb/home/widget/program_slider_item.dart';

class HomeProgramsSlider extends StatelessWidget {
  HomeProgramsSlider({super.key});

  final List<MerchantProgramModel> merchantProgram = [
    MerchantProgramModel(
      programTitle: "Program 1",
      programIcon: Icons.ad_units,
      isActive: true,
    ),
    MerchantProgramModel(
      programTitle: "Program 2",
      programIcon: Icons.dinner_dining,
      isActive: false,
    ),
    MerchantProgramModel(
      programTitle: "Prgoram 3",
      programIcon: Icons.business,
      isActive: true,
    ),
    MerchantProgramModel(
      programTitle: "Program 4",
      programIcon: Icons.card_giftcard,
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          _buildMerchantPrograms(context),
          _buildProgramSlider(context)
        ],
      ),
    );
  }

  Widget _buildMerchantPrograms(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        context.tr("home_screen.merchant_program"),
        style: theme(context).textTheme.titleLarge,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildProgramSlider(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 250.h,
      child: CarouselSlider.builder(
        itemCount: 4,
        options: CarouselOptions(
          enlargeCenterPage: true,
          viewportFraction: 0.5,
          enableInfiniteScroll: false,
        ),
        itemBuilder: (context, index, realIndex) {
          debugPrint("index = $index, real index = $realIndex");
          return ProgramSliderItem(
            scrollIndex: index,
            merchantProgram: merchantProgram[index],
          );
        },
      ),
    );
  }
}

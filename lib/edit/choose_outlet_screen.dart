import 'dart:convert';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_empty_state.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_snack_bar.dart';
import 'package:kualiva_merchant_mb/data/dio_client.dart';
import 'package:kualiva_merchant_mb/data/models/outlet_model.dart';
import 'package:kualiva_merchant_mb/edit/widget/choose_outlet_list_item.dart';

class ChooseOutletScreen extends StatefulWidget {
  const ChooseOutletScreen({super.key});

  @override
  State<ChooseOutletScreen> createState() => _ChooseOutletScreenState();
}

class _ChooseOutletScreenState extends State<ChooseOutletScreen> {
  bool isLoading = false;
  List<OutletModel> outletModel = [];

  @override
  void initState() {
    super.initState();
    getOutlets();
  }

  void getOutlets() async {
    final dio = await DioClient().dio();
    final res = await dio.get('/merchant-fnb');
    Map<String, dynamic> mapRes = jsonDecode(res.toString());

    if (mapRes["status"] == 200) {
      setState(() {
        isLoading = false;
      });
      List<Map<String, dynamic>> mapData =
          List<Map<String, dynamic>>.from(mapRes["data"]);
      for (int i = 0; i <= mapData.length; i++) {
        outletModel.add(OutletModel(
          id: mapData[i]["id"],
          userMerchantId: mapData[i]["userMerchantId"],
          outletName: mapData[i]["nameOutlet"],
          address: mapData[i]["address"],
          phoneBusiness: mapData[i]["phoneBusiness"],
          emailOptional: mapData[i]["emailOptional"],
          businessLicenseFile: mapData[i]["businessLicenseFile"],
          latitude: mapData[i]["latitude"],
          longitude: mapData[i]["longitude"],
          googlePlaceId: mapData[i]["googlePlaceId"],
          createdAt: DateTime.parse(mapData[i]["createdAt"]),
          updatedAt: DateTime.parse(mapData[i]["updatedAt"]),
          deletedAt: Faker().date.dateTime(),
          operationalDay: List.generate(7, (index) => index),
          operationalTimeOpen:
              List.generate(7, (index) => const TimeOfDay(hour: 0, minute: 0)),
          operationalTimeClose:
              List.generate(7, (index) => const TimeOfDay(hour: 0, minute: 0)),
          menuPicture: List.generate(
              5,
              (index) =>
                  Faker().image.loremPicsum(random: Random().nextInt(300))),
        ));
      }
      if (!mounted) return;
      showSnackBar(context, Icons.done_outline, Colors.greenAccent,
          context.tr("sign_in.sign_in_success"), Colors.greenAccent);
    } else {
      setState(() {
        isLoading = false;
      });
      if (!mounted) return;
      showSnackBar(context, Icons.error_outline, Colors.red,
          context.tr("sign_in.sign_in_failed"), Colors.red);
    }
  }

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
      itemCount: outletModel.isEmpty ? 1 : outletModel.length,
      itemBuilder: (context, index) {
        if (outletModel.isEmpty) {
          return const CustomEmptyState();
        }
        return ChooseOutletListItem(
          outletModel: outletModel[index],
        );
      },
    );
  }
}

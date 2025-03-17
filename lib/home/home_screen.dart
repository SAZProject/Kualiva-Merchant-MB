import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:kualiva_merchant_mb/common/utility/lelog.dart';
import 'package:kualiva_merchant_mb/common/utility/sized_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_app_bar.dart';
import 'package:kualiva_merchant_mb/data/dio_client.dart';
import 'package:kualiva_merchant_mb/data/models/product.dart';
import 'package:kualiva_merchant_mb/hive/hive_boxes.dart';
import 'package:kualiva_merchant_mb/home/widget/home_analytic.dart';
import 'package:kualiva_merchant_mb/home/widget/home_programs_slider.dart';
import 'package:kualiva_merchant_mb/home/widget/home_recent_review.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getOrder();
  }

  Future<void> _getOrder() async {
    final productsBox = Hive.box<Product>(productBox);

    final dio = await DioClient().dio();
    final response = await dio.get('/products', queryParameters: {"limit": 10});

    if (response.statusCode == 200) {
      final bodyJson = response.data as Map<String, dynamic>;
      final productsJson = (bodyJson['products'] as List<dynamic>)
          .map((e) => Product.fromMap(e))
          .toList();

      if (productsBox.values.toList().isEmpty) {
        productsBox.addAll(productsJson);
      } else {
        LeLog.d(this, "Data on hive already exist");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _homeAppBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _homeAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.tr("common.appbar",
          namedArgs: {"name": "name", "userId": "User Id"}),
      leadingIcon: Icons.switch_account,
      onBackPressed: () {},
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.h),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25.h,
            ),
            onPressed: () {
              final productsBox = Hive.box<Product>(productBox);
              final listProduct = productsBox.values.toList();
              LeLog.d(this, "Open Hive : $listProduct");
            },
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
            HomeProgramsSlider(),
            const HomeAnalytic(),
            const HomeRecentReview(),
          ],
        ),
      ),
    );
  }
}

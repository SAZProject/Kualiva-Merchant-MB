import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/screen/coming_soon.dart';
import 'package:kualiva_merchant_mb/home/feature/home_app_bar_feature.dart';
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
    // _getOrder();
  }

  // Future<void> _getOrder() async {
  //   final productsBox = Hive.box<Product>(productBox);

  //   final dio = await DioClient().dio();
  //   final response = await dio.get('/products', queryParameters: {"limit": 10});

  //   if (response.statusCode == 200) {
  //     final bodyJson = response.data as Map<String, dynamic>;
  //     final productsJson = (bodyJson['products'] as List<dynamic>)
  //         .map((e) => Product.fromMap(e))
  //         .toList();

  //     if (productsBox.values.toList().isEmpty) {
  //       productsBox.addAll(productsJson);
  //     } else {
  //       LeLog.d(this, "Data on hive already exist");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: HomeAppBarFeature(),
        body: ComingSoon(),
      ),
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

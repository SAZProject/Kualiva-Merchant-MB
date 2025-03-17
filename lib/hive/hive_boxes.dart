import 'package:hive_ce/hive.dart';
import 'package:kualiva_merchant_mb/data/models/product.dart';

const productBox = "ProductBox";

class HiveBoxes {
  static Future<void> openBox() async {
    await Future.wait([
      Hive.openBox<Product>(productBox),
    ]);
  }

  static Future<void> deleteAllBox() async {
    await Hive.close();
    await Hive.deleteFromDisk();
    await openBox();
  }
}

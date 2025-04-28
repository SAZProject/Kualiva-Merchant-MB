import 'package:hive_ce/hive.dart';
import 'package:kualiva_merchant_mb/_data/models/product.dart';
import 'package:kualiva_merchant_mb/auth/model/user_model.dart';
import 'package:kualiva_merchant_mb/auth/model/user_profile_model.dart';

const productBox = "ProductBox";
const userBox = "UserBox";
const userProfileBox = "userProfileBox";

class HiveBoxes {
  static Future<void> openBox() async {
    await Future.wait([
      Hive.openBox<Product>(productBox),
      Hive.openBox<UserModel>(userBox),
      Hive.openBox<UserProfileModel>(userProfileBox),
    ]);
  }

  static Future<void> deleteAllBox() async {
    await Hive.close();
    await Hive.deleteFromDisk();
    await openBox();
  }
}

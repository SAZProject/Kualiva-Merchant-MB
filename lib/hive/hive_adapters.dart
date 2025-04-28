import 'package:hive_ce/hive.dart';
import 'package:kualiva_merchant_mb/_data/models/product.dart';
import 'package:kualiva_merchant_mb/auth/model/user_model.dart';
import 'package:kualiva_merchant_mb/auth/model/user_profile_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Product>(),
  AdapterSpec<UserModel>(),
  AdapterSpec<UserProfileModel>(),
])
class HiveAdapters {}

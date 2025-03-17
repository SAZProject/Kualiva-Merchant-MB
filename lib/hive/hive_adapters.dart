import 'package:hive_ce/hive.dart';
import 'package:kualiva_merchant_mb/data/models/product.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Product>(),
])
class HiveAdapters {}

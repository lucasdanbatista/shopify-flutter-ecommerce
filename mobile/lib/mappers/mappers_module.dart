import 'package:get_it/get_it.dart';

import '../core/module.dart';
import 'product_category_mapper.dart';
import 'product_mapper.dart';
import 'product_variant_mapper.dart';

class MappersModule implements Module {
  @override
  void init(GetIt i) {
    i.registerLazySingleton(() => ProductCategoryMapper());
    i.registerLazySingleton(() => ProductMapper(i.get()));
    i.registerLazySingleton(() => ProductVariantMapper());
  }
}
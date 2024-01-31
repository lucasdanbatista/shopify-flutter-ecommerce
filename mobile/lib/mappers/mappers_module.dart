import 'package:get_it/get_it.dart';

import '../core/module.dart';
import 'cart_line_mapper.dart';
import 'cart_mapper.dart';
import 'product_category_mapper.dart';
import 'product_mapper.dart';
import 'product_variant_mapper.dart';

class MappersModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerLazySingleton(() => ProductCategoryMapper());
    i.registerLazySingleton(() => ProductMapper(i.get()));
    i.registerLazySingleton(() => ProductVariantMapper());
    i.registerLazySingleton(() => CartMapper(i.get()));
    i.registerLazySingleton(() => CartLineMapper(i.get()));
  }
}

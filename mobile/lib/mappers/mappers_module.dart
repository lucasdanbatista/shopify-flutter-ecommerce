import 'package:get_it/get_it.dart';

import '../core/module.dart';
import 'product_mapper.dart';
import 'product_variant_mapper.dart';

class MappersModule implements Module {
  @override
  void init(GetIt i) {
    i.registerLazySingleton(() => ProductMapper(i.get()));
    i.registerLazySingleton(() => ProductVariantMapper());
  }
}

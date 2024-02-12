import 'package:get_it/get_it.dart';

import '../core/module.dart';
import 'address_mapper.dart';
import 'cart_line_mapper.dart';
import 'cart_mapper.dart';
import 'checkout_mapper.dart';
import 'order_item_mapper.dart';
import 'order_mapper.dart';
import 'product_category_mapper.dart';
import 'product_mapper.dart';
import 'product_variant_mapper.dart';
import 'shipping_rate_mapper.dart';

class MappersModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerLazySingleton(() => ProductCategoryMapper());
    i.registerLazySingleton(() => ProductMapper(i.get()));
    i.registerLazySingleton(() => ProductVariantMapper());
    i.registerLazySingleton(() => CartMapper(i.get()));
    i.registerLazySingleton(() => CartLineMapper(i.get()));
    i.registerLazySingleton(() => OrderMapper(i.get(), i.get()));
    i.registerLazySingleton(() => OrderItemMapper(i.get()));
    i.registerLazySingleton(() => AddressMapper());
    i.registerLazySingleton(() => CheckoutMapper(i.get()));
    i.registerLazySingleton(() => ShippingRateMapper());
  }
}

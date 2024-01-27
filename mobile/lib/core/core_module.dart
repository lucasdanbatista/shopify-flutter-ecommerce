import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'auth_manager.dart';
import 'environment.dart';
import 'module.dart';
import 'repositories/cart_repository.dart';
import 'repositories/checkout_repository.dart';
import 'repositories/product_category_repository.dart';
import 'repositories/product_repository.dart';

class CoreModule implements Module {
  @override
  void init(GetIt i) {
    i.registerLazySingleton<Environment>(() => DebugEnvironment());
    i.registerLazySingleton(() => const FlutterSecureStorage());
    i.registerLazySingleton<AuthManager>(() => DefaultAuthManager(i.get(), i.get(), i.get()));
    i.registerLazySingleton<ProductRepository>(
      () => DefaultProductRepository(i.get(), i.get(), i.get()),
    );
    i.registerLazySingleton<ProductCategoryRepository>(
      () => DefaultProductCategoryRepository(i.get(), i.get()),
    );
    i.registerLazySingleton<CartRepository>(() => DefaultCartRepository(i.get(), i.get()));
    i.registerLazySingleton<CheckoutRepository>(() => DefaultCheckoutRepository(i.get()));
  }
}

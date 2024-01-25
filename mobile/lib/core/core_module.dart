import 'package:get_it/get_it.dart';

import 'environment.dart';
import 'module.dart';
import 'repositories/product_repository.dart';

class CoreModule implements Module {
  @override
  void init(GetIt i) {
    i.registerLazySingleton<Environment>(() => DebugEnvironment());
    i.registerLazySingleton<ProductRepository>(
      () => DefaultProductRepository(i.get(), i.get()),
    );
  }
}

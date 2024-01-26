import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'cart_view_model.dart';

class CartModule implements Module {
  @override
  void init(GetIt i) {
    i.registerLazySingleton(() => CartViewModel(i.get()));
  }
}

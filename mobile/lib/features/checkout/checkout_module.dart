import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'checkout_view_model.dart';

class CheckoutModule implements Module {
  @override
  void init(GetIt i) {
    i.registerFactory(() => CheckoutViewModel(i.get()));
  }
}

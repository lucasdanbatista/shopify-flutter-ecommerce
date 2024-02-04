import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'order_details_view_model.dart';

class OrderDetailsModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => OrderDetailsViewModel(i.get()));
  }
}

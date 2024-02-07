import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'addresses_view_model.dart';

class AddressesModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => AddressesViewModel(i.get()));
  }
}

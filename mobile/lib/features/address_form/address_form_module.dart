import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'address_form_view_model.dart';

class AddressFormModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => AddressFormViewModel(i.get()));
  }
}

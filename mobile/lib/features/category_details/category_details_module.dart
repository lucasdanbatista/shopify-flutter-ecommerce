import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'category_details_view_model.dart';

class CategoryDetailsModule implements Module {
  @override
  void init(GetIt i) {
    i.registerFactory(() => CategoryDetailsViewModel(i.get()));
  }
}
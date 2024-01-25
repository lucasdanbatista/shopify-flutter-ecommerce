import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'categories_view_model.dart';

class CategoriesModule implements Module {
  @override
  void init(GetIt i) {
    i.registerFactory(() => CategoriesViewModel(i.get()));
  }
}

import 'package:flutter/widgets.dart';

import '../../core/entities/product_category.dart';
import '../../core/repositories/product_category_repository.dart';
import '../../rx/observed_data.dart';

class CategoriesViewModel {
  final ProductCategoryRepository _repository;

  CategoriesViewModel(this._repository);

  final ValueNotifier<ObservedData<List<ProductCategory>>> categories =
      ValueNotifier(EmptyData());

  void fetch() async =>
      categories.value = FoundData(await _repository.findAll());
}

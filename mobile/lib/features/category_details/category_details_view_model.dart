import 'package:flutter/cupertino.dart';

import '../../core/entities/product.dart';
import '../../core/repositories/product_repository.dart';
import '../../rx/observed_data.dart';

class CategoryDetailsViewModel {
  final ProductRepository _repository;

  CategoryDetailsViewModel(this._repository);

  ValueNotifier<ObservedData<List<Product>>> products = ValueNotifier(
    EmptyData(),
  );

  void fetch(String id) async =>
      products.value = FoundData(await _repository.findAllByCategoryId(id));
}

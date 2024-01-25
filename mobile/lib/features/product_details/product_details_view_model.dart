import 'package:flutter/widgets.dart';

import '../../core/entities/product.dart';
import '../../core/repositories/product_repository.dart';
import '../../rx/observed_data.dart';

class ProductDetailsViewModel {
  final ProductRepository _repository;

  ProductDetailsViewModel(this._repository);

  final ValueNotifier<ObservedData<Product>> product = ValueNotifier(
    ObservedData.empty(),
  );

  void fetch(String id) async =>
      product.value = ObservedData.found(await _repository.findById(id));
}

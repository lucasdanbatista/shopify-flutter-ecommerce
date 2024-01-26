import 'package:mobx/mobx.dart';

import '../../core/entities/product.dart';
import '../../core/repositories/product_repository.dart';

part 'product_details_view_model.g.dart';

class ProductDetailsViewModel = ProductDetailsViewModelBase
    with _$ProductDetailsViewModel;

abstract class ProductDetailsViewModelBase with Store {
  final ProductRepository _repository;

  ProductDetailsViewModelBase(this._repository);

  @observable
  Product? product;

  @observable
  bool addedToCart = false;

  @action
  Future<void> fetch(String id) async =>
      product = await _repository.findById(id);

  @action
  void setAddedToCart(bool value) => addedToCart = value;
}

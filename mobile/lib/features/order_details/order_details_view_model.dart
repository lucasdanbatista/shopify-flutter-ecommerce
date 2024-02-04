import 'package:mobx/mobx.dart';

import '../../core/entities/order.dart';
import '../../core/repositories/order_repository.dart';

part 'order_details_view_model.g.dart';

class OrderDetailsViewModel = OrderDetailsViewModelBase with _$OrderDetailsViewModel;

abstract class OrderDetailsViewModelBase with Store {
  final OrderRepository _repository;

  OrderDetailsViewModelBase(this._repository);

  @observable
  Order? order;

  @action
  Future<void> fetch(String id) async => order = await _repository.findById(id);
}

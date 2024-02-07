import 'package:mobx/mobx.dart';

import '../../core/entities/address.dart';
import '../../core/repositories/address_repository.dart';

part 'addresses_view_model.g.dart';

class AddressesViewModel = AddressesViewModelBase with _$AddressesViewModel;

abstract class AddressesViewModelBase with Store {
  final AddressRepository _repository;

  AddressesViewModelBase(this._repository);

  @observable
  List<Address> addresses = ObservableList();

  @action
  Future<void> fetch() async =>
      addresses = ObservableList.of(await _repository.findAll());

  Future<void> deleteById(String id) => _repository.deleteById(id);
}

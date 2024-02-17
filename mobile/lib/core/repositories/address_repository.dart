import '../../dtos/address_dto.dart';
import '../../mappers/address_mapper.dart';
import '../../providers/address_provider.dart';
import '../entities/address.dart';

abstract interface class AddressRepository {
  Future<Address> create(Address address);

  Future<Address> update(Address address);

  Future<List<Address>> findAll();

  Future<void> deleteById(String id);
}

class DefaultAddressRepository implements AddressRepository {
  final AddressProvider _provider;
  final AddressMapper _mapper;

  DefaultAddressRepository(this._provider, this._mapper);

  @override
  Future<Address> create(Address address) async {
    final response = await _provider.create(
      AddressDTO(
        recipientName: address.recipientName,
        street: address.street,
        buildingNumber: address.buildingNumber,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
        zipcode: address.zipcode,
      ),
    );
    return _mapper.toEntity(response);
  }

  @override
  Future<Address> update(Address address) async {
    final response = await _provider.update(
      AddressDTO(
        id: address.id,
        recipientName: address.recipientName,
        street: address.street,
        buildingNumber: address.buildingNumber,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
        zipcode: address.zipcode,
      ),
    );
    return _mapper.toEntity(response);
  }

  @override
  Future<void> deleteById(String id) => _provider.delete(AddressDTO(id: id));

  @override
  Future<List<Address>> findAll() async {
    final response = await _provider.findAll();
    return response.map(_mapper.toEntity).toList();
  }
}

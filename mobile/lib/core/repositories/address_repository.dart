import '../../dtos/address_dto.dart';
import '../../mappers/address_mapper.dart';
import '../../providers/address_provider.dart';
import '../entities/address.dart';

abstract interface class AddressRepository {
  Future<Address> create({
    required String recipientFirstName,
    required String recipientLastName,
    required String line1,
    required String line2,
    required String city,
    required String province,
    required String zipcode,
  });

  Future<List<Address>> findAll();

  Future<void> deleteById(String id);
}

class DefaultAddressRepository implements AddressRepository {
  final AddressProvider _provider;
  final AddressMapper _mapper;

  DefaultAddressRepository(this._provider, this._mapper);

  @override
  Future<Address> create({
    required String recipientFirstName,
    required String recipientLastName,
    required String line1,
    required String line2,
    required String city,
    required String province,
    required String zipcode,
  }) async {
    final response = await _provider.create(
      AddressDTO(
        recipientFirstName: recipientFirstName,
        recipientLastName: recipientLastName,
        line1: line1,
        line2: line2,
        city: city,
        province: province,
        zipcode: zipcode,
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

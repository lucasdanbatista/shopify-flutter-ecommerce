import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/address_dto.dart';

part 'address_provider.g.dart';

@RestApi(baseUrl: '/v1/addresses')
abstract class AddressProvider {
  factory AddressProvider(Dio dio) = _AddressProvider;

  @POST('')
  Future<AddressDTO> create(@Body() AddressDTO address);

  @PUT('')
  Future<AddressDTO> update(@Body() AddressDTO address);

  @DELETE('')
  Future<void> delete(@Body() AddressDTO address);

  @GET('')
  Future<List<AddressDTO>> findAll();
}
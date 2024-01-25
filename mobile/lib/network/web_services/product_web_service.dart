import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/product_dto.dart';

part 'product_web_service.g.dart';

@RestApi(baseUrl: '/v1/products')
abstract class ProductWebService {
  factory ProductWebService(Dio dio) = _ProductWebService;

  @GET('/{id}')
  Future<ProductDTO> findProductById(@Path('id') String id);
}

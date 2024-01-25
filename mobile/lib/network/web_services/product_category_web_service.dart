import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/product_category_dto.dart';
import '../dtos/product_dto.dart';

part 'product_category_web_service.g.dart';

@RestApi(baseUrl: '/v1/categories')
abstract class ProductCategoryWebService {
  factory ProductCategoryWebService(Dio dio) = _ProductCategoryWebService;

  @GET('')
  Future<List<ProductCategoryDTO>> findAll();

  @GET('/{id}/products')
  Future<List<ProductDTO>> findAllProductsByCategoryId(@Path('id') String id);
}

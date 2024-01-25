import '../../mappers/product_category_mapper.dart';
import '../../network/web_services/product_category_web_service.dart';
import '../entities/product_category.dart';

abstract interface class ProductCategoryRepository {
  Future<List<ProductCategory>> findAll();
}

class DefaultProductCategoryRepository implements ProductCategoryRepository {
  final ProductCategoryWebService _service;
  final ProductCategoryMapper _mapper;

  DefaultProductCategoryRepository(this._service, this._mapper);

  @override
  Future<List<ProductCategory>> findAll() async {
    final response = await _service.findAll();
    return response.map(_mapper.toEntity).toList();
  }
}

import '../../mappers/product_mapper.dart';
import '../../network/web_services/product_web_service.dart';
import '../entities/product.dart';

abstract interface class ProductRepository {
  Future<Product> findById(String id);
}

class DefaultProductRepository implements ProductRepository {
  final ProductWebService _service;
  final ProductMapper _mapper;

  DefaultProductRepository(this._service, this._mapper);

  @override
  Future<Product> findById(String id) async {
    final response = await _service.findProductById(id);
    return _mapper.toEntity(response);
  }
}

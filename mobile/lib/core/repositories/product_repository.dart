import '../../mappers/product_mapper.dart';
import '../../network/web_services/product_category_web_service.dart';
import '../../network/web_services/product_web_service.dart';
import '../entities/product.dart';

abstract interface class ProductRepository {
  Future<Product> findById(String id);

  Future<List<Product>> findAllByCategoryId(String id);
}

class DefaultProductRepository implements ProductRepository {
  final ProductWebService _productsService;
  final ProductCategoryWebService _categoryService;
  final ProductMapper _mapper;

  DefaultProductRepository(
    this._productsService,
    this._categoryService,
    this._mapper,
  );

  @override
  Future<Product> findById(String id) async {
    final response = await _productsService.findProductById(id);
    return _mapper.toEntity(response);
  }

  @override
  Future<List<Product>> findAllByCategoryId(String id) async {
    final response = await _categoryService.findAllProductsByCategoryId(id);
    return response.map(_mapper.toEntity).toList();
  }
}

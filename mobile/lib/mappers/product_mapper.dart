import '../core/entities/product.dart';
import '../network/dtos/product_dto.dart';
import 'entity_mapper.dart';
import 'product_variant_mapper.dart';

class ProductMapper implements EntityMapper<ProductDTO, Product> {
  final ProductVariantMapper _variantMapper;

  ProductMapper(this._variantMapper);

  @override
  Product toEntity(ProductDTO it) {
    return Product.lazy(
      id: it.id,
      title: it.title,
      description: it.description,
      images: it.images,
      variants: it.variants?.map(_variantMapper.toEntity).toList(),
    );
  }
}

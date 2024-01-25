import '../core/entities/product_variant.dart';
import '../network/dtos/product_variant_dto.dart';
import 'entity_mapper.dart';

class ProductVariantMapper
    implements EntityMapper<ProductVariantDTO, ProductVariant> {
  @override
  ProductVariant toEntity(ProductVariantDTO it) {
    return ProductVariant.lazy(
      originalPrice: it.originalPrice,
      sellingPrice: it.sellingPrice,
    );
  }
}

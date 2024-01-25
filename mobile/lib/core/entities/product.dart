import 'entity.dart';
import 'product_variant.dart';

class Product implements Entity {
  late final String id;
  late final String title;
  late final String description;
  late final List<Uri> images;
  late final List<ProductVariant> variants;

  Product.lazy({
    String? id,
    String? title,
    String? description,
    List<Uri>? images,
    List<ProductVariant>? variants,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (description != null) this.description = description;
    if (images != null) this.images = images;
    if (variants != null) this.variants = variants;
  }
}

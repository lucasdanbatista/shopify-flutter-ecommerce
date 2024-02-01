import 'entity.dart';
import 'product_variant.dart';

class OrderItem implements Entity {
  late final String title;
  late final ProductVariant productVariant;

  OrderItem.lazy({
    String? title,
    ProductVariant? productVariant,
  }) {
    if (title != null) this.title = title;
    if (productVariant != null) this.productVariant = productVariant;
  }
}

import 'entity.dart';

class ProductVariant implements Entity {
  late final double originalPrice;
  late final double sellingPrice;

  ProductVariant.lazy({
    double? originalPrice,
    double? sellingPrice,
  }) {
    if (originalPrice != null) this.originalPrice = originalPrice;
    if (sellingPrice != null) this.sellingPrice = sellingPrice;
  }
}

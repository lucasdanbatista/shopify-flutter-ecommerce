import 'entity.dart';

class ProductVariant implements Entity {
  late final String id;
  late final double originalPrice;
  late final double sellingPrice;
  late final String title;
  late final Uri image;

  ProductVariant.lazy({
    String? id,
    double? originalPrice,
    double? sellingPrice,
    String? title,
    Uri? image,
  }) {
    if (id != null) this.id = id;
    if (originalPrice != null) this.originalPrice = originalPrice;
    if (sellingPrice != null) this.sellingPrice = sellingPrice;
    if (title != null) this.title = title;
    if (image != null) this.image = image;
  }
}

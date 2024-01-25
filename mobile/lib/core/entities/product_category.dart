import 'entity.dart';

class ProductCategory implements Entity {
  late final String id;
  late final String title;

  ProductCategory.lazy({
    String? id,
    String? title,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
  }
}

import 'cart_line.dart';
import 'entity.dart';

class Cart implements Entity {
  late final String id;
  late final List<CartLine> lines;
  late final double subtotal;
  late final double total;

  Cart.lazy({
    String? id,
    List<CartLine>? lines,
    double? subtotal,
    double? total,
  }) {
    if (id != null) this.id = id;
    if (lines != null) this.lines = lines;
    if (subtotal != null) this.subtotal = subtotal;
    if (total != null) this.total = total;
  }
}
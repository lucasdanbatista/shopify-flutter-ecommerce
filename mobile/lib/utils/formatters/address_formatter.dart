import '../../core/entities/address.dart';
import 'formatter.dart';

class AddressFormatter implements Formatter<Address, String> {
  @override
  String format(Address it) =>
      '${it.line1}, ${it.line2}. ${it.city}, ${it.province} - ${it.zipcode}.';
}

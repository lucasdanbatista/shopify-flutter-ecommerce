import '../../core/entities/address.dart';
import 'formatter.dart';

class AddressFormatter implements Formatter<Address, String> {
  @override
  String format(Address it) =>
      '${it.street}, ${it.buildingNumber}, ${it.neighborhood}. ${it.city}, ${it.state} - ${it.zipcode}.';
}

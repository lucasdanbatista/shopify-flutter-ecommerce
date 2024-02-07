// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressesViewModel on AddressesViewModelBase, Store {
  late final _$addressesAtom =
      Atom(name: 'AddressesViewModelBase.addresses', context: context);

  @override
  List<Address> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(List<Address> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('AddressesViewModelBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
addresses: ${addresses}
    ''';
  }
}

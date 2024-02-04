// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderDetailsViewModel on OrderDetailsViewModelBase, Store {
  late final _$orderAtom =
      Atom(name: 'OrderDetailsViewModelBase.order', context: context);

  @override
  Order? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(Order? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('OrderDetailsViewModelBase.fetch', context: context);

  @override
  Future<void> fetch(String id) {
    return _$fetchAsyncAction.run(() => super.fetch(id));
  }

  @override
  String toString() {
    return '''
order: ${order}
    ''';
  }
}

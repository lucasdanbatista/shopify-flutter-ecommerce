import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/init_state_mixin.dart';
import 'orders_view_model.dart';
import 'widgets/order_list_tile.dart';

@RoutePage()
class OrdersPage extends StatelessWidget with InitStateMixin {
  final viewModel = GetIt.I<OrdersViewModel>();

  OrdersPage({super.key});

  @override
  void initState() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 72),
          itemCount: viewModel.orders.length,
          itemBuilder: (context, index) {
            final order = viewModel.orders[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: OrderListTile(order),
            );
          },
        ),
      ),
    );
  }
}

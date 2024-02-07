import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../util/formatters/address_formatter.dart';
import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';
import 'addresses_view_model.dart';

@RoutePage()
class AddressesPage extends StatelessWidget with InitStateMixin {
  final viewModel = GetIt.I<AddressesViewModel>();

  AddressesPage({super.key});

  @override
  void initState() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus endereços'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: viewModel.addresses.length,
          itemBuilder: (context, index) {
            final address = viewModel.addresses[index];
            return ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(address.recipientName),
              subtitle: Text(AddressFormatter().format(address)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  IconButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Apagar endereço?'),
                          content: Text(AddressFormatter().format(address)),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await viewModel.deleteById(address.id);
                                viewModel.fetch();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.redAccent,
                              ),
                              child: const Text('SIM'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('NÃO'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushRoute(AddressFormRoute());
          viewModel.fetch();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'address_form_view_model.dart';

@RoutePage()
class AddressFormPage extends StatelessWidget {
  final viewModel = GetIt.I<AddressFormViewModel>();
  final recipientNameController = TextEditingController();
  final streetController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final zipcodeController = TextEditingController();

  AddressFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Novo endereço'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: recipientNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Destinatário',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: streetController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Rua',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: neighborhoodController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Bairro',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: buildingNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Número',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cidade',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: provinceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Estado',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              controller: zipcodeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'CEP',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () async {
            final address = await viewModel.save(
              recipientFirstName: recipientNameController.text.trim().split(' ').first,
              recipientLastName: recipientNameController.text.trim().split(' ').last,
              line1: '${streetController.text.trim()}, ${buildingNumberController.text.trim()}',
              line2: neighborhoodController.text.trim(),
              city: cityController.text.trim(),
              province: provinceController.text.trim(),
              zipcode: zipcodeController.text.trim(),
            );
            if (context.mounted) {
              Navigator.of(context).pop(address);
            }
          },
          child: const Text('SALVAR'),
        ),
      ],
    );
  }
}

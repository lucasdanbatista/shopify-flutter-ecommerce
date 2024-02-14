import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/address.dart';
import '../../utils/init_state_mixin.dart';
import 'address_form_view_model.dart';

@RoutePage()
class AddressFormPage extends StatelessWidget with InitStateMixin {
  final Address? initialAddress;
  final viewModel = GetIt.I<AddressFormViewModel>();
  final recipientNameController = TextEditingController();
  final streetController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final zipcodeController = TextEditingController();

  AddressFormPage({
    super.key,
    this.initialAddress,
  });

  @override
  void initState() {
    if (initialAddress != null) {
      fillForms(initialAddress!);
    }
  }

  void fillForms(Address address) {
    recipientNameController.text = address.recipientName.trim();
    streetController.text = address.line1.split(',').first.trim();
    buildingNumberController.text = address.line1.split(',').last.trim();
    neighborhoodController.text = address.line2.trim();
    cityController.text = address.city.trim();
    provinceController.text = address.province.trim();
    zipcodeController.text = address.zipcode.trim();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          initialAddress != null ? 'Editar endereço' : 'Novo endereço',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: recipientNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Destinatário',
                labelText: 'Destinatário',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              controller: streetController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Rua',
                labelText: 'Rua',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              controller: buildingNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Número',
                labelText: 'Número',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              controller: neighborhoodController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Bairro',
                labelText: 'Bairro',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cidade',
                labelText: 'Cidade',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: provinceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Estado',
                labelText: 'Estado',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 12)),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              controller: zipcodeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'CEP',
                labelText: 'CEP',
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
              id: initialAddress?.id,
              recipientName: recipientNameController.text,
              street: streetController.text,
              buildingNumber: buildingNumberController.text,
              neighborhood: neighborhoodController.text,
              city: cityController.text,
              province: provinceController.text,
              zipcode: zipcodeController.text,
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

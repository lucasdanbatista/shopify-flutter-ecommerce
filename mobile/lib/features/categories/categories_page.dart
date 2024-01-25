import 'package:flutter/material.dart';

import '../../core/entities/product_category.dart';
import '../../rx/observable_widget.dart';
import '../../rx/observed_data.dart';
import '../../util/init_state_mixin.dart';
import '../../util/route.dart';
import '../category_details/category_details_page.dart';
import '../category_details/category_details_route.dart';
import 'categories_view_model.dart';

class CategoriesPage extends StatelessWidget with InitStateMixin {
  final CategoriesViewModel viewModel;

  const CategoriesPage({
    super.key,
    required this.viewModel,
  });

  @override
  void initState() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: ObservableWidget(
        observable: viewModel.categories,
        builder: (context, data) {
          if (data is FoundData<List<ProductCategory>>) {
            return ListView.builder(
              itemCount: data.value.length,
              itemBuilder: (context, index) {
                final category = data.value[index];
                return ListTile(
                  title: Text(category.title),
                  onTap: () => context.pushRoute(
                    CategoryDetailsRoute(),
                    args: CategoryDetailsArguments(
                      categoryId: category.id,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

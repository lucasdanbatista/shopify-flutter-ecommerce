import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/product_category.dart';
import '../../rx/observable_widget.dart';
import '../../rx/observed_data.dart';
import '../../util/init_state_mixin.dart';
import '../../util/router.gr.dart';
import 'categories_view_model.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget with InitStateMixin {
  final viewModel = GetIt.I<CategoriesViewModel>();

  CategoriesPage({super.key});

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
                  minVerticalPadding: 20,
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.category_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  title: Text(
                    category.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  onTap: () => context.pushRoute(
                    CategoryDetailsRoute(
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

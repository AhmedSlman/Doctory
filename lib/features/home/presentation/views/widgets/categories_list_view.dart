import 'package:flutter/material.dart';
import '../../../data/models/categories_model.dart';
import 'custom_categories_list_view.item.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesListView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomCategoriesListViewItem(name: category.name),
          );
        },
      ),
    );
  }
}

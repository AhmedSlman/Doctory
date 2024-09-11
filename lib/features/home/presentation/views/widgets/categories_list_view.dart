import 'package:flutter/material.dart';
import '../../../data/models/categories_model.dart';
import 'custom_categories_list_view.item.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryModel> categories;
  final ValueChanged<String> onCategorySelected;

  const CategoriesListView({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onCategorySelected(category.name),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomCategoriesListViewItem(name: category.name),
            ),
          );
        },
      ),
    );
  }
}

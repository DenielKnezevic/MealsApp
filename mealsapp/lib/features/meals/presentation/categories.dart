import 'package:flutter/material.dart';

import '../domain/category.dart';
import '../domain/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2), 
      children: [
      for (var category in availableCategories)
        CategoryItem(category: category),
    ]);
  }
}
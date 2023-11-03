import 'package:flutter/material.dart';
import 'package:mealsapp/features/meals/domain/meal.dart';
import 'package:mealsapp/features/meals/presentation/meals.dart';

import 'category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category,super.key});

   final Category category;

   List<Meal> selectMeals(){
    var categoryMeals = Meal.dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    });

    return categoryMeals.toList();
   }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).secondaryHeaderColor,  
      borderRadius: BorderRadius.circular(16),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mealss(category: category,)));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
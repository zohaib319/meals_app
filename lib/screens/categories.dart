import 'package:flutter/material.dart';
import 'package:meals_app/model/category_model.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/model/meal_model.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.favouriteMeals});

  final List<MealModel> favouriteMeals;

  void _setSelectedCategory(BuildContext context, CategoryModel category) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            mealsList: favouriteMeals
                .where((meal) => meal.categories.contains(category.id))
                .toList())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _setSelectedCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}

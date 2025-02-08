import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.mealsList});

  final String? title;
  final List<MealModel> mealsList;

  void _openSelectedMeal(BuildContext context, MealModel meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetails(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: mealsList.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: mealsList[index],
        onMealSelected: () {
          _openSelectedMeal(ctx, mealsList[index]);
        },
      ),
    );

    if (mealsList.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.access_alarm,
              size: 100.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Uh,Oh... No Meals Found.',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Try selecting some other category.',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}

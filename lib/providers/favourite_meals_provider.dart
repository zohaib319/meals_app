import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal_model.dart';

class FavouriteMealsNotifier extends StateNotifier<List<MealModel>> {
  // initialize with an empty list
  FavouriteMealsNotifier() : super([]);

  // add own methods to add remove favorite meals from the list.
  String toggleFavouriteMeal(MealModel meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return 'Meal is removed from favourites.';
    } else {
      // keep all the current elements and add extra meal item which is just selected as favourite.
      // ...state gives current all items of the state which is List<MealModel>
      // we cannot use .add or .remove of conventional lists due to addressing issues. so we must return new list everytime.
      state = [...state, meal];
      return 'Meal is added to favourites.';
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<MealModel>>((ref) {
  return FavouriteMealsNotifier();
});

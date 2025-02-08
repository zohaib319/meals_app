import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum FilterEnum {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<FilterEnum, bool>> {
  FiltersNotifier()
      : super({
          FilterEnum.glutenFree: false,
          FilterEnum.lactoseFree: false,
          FilterEnum.vegetarian: false,
          FilterEnum.vegan: false
        });

  void setFilter(FilterEnum filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<FilterEnum, bool> selectedFilters) {
    state = selectedFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<FilterEnum, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[FilterEnum.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[FilterEnum.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[FilterEnum.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

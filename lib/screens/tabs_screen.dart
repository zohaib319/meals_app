import 'package:flutter/material.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/side_drawer.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  late Widget selectedTabContent;
  int _selectedTabIndex = 0;
  String appBarText = 'Categories';

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<FilterEnum, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTabContent = Categories(
      favouriteMeals: dummyMeals,
    );
  }

  // add or remove favourite meal from favourite meals list

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    if (_selectedTabIndex == 0) {
      selectedTabContent = Categories(
        favouriteMeals: filteredMeals,
      );
      appBarText = 'Categories';
    } else if (_selectedTabIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      appBarText = 'Favourites';
      selectedTabContent = MealsScreen(
        mealsList: favouriteMeals,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      drawer: SideDrawer(
        onDrawerMenuTapped: _setScreen,
      ),
      body: selectedTabContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'All Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites')
        ],
        onTap: (index) {
          _selectPage(index);
        },
      ),
    );
  }
}

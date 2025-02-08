import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Gluten-Free'),
            subtitle: Text('Chose Gluten Free if you are allergic.'),
            value: activeFilters[FilterEnum.glutenFree]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(FilterEnum.glutenFree, value);
            },
          ),
          SwitchListTile(
            title: Text('Lactose-Free'),
            subtitle: Text('Chose lactose free if you like.'),
            value: activeFilters[FilterEnum.lactoseFree]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(FilterEnum.lactoseFree, value);
            },
          ),
          SwitchListTile(
            title: Text('Vegetarian'),
            subtitle: Text('Chose vegetarian if you like.'),
            value: activeFilters[FilterEnum.vegetarian]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(FilterEnum.vegetarian, value);
            },
          ),
          SwitchListTile(
            title: Text('Vegan'),
            subtitle: Text('Chose vegan if you like.'),
            value: activeFilters[FilterEnum.vegan]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(FilterEnum.vegan, value);
            },
          )
        ],
      ),
    );
  }
}

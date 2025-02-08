import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onDrawerMenuTapped});

  final void Function(String identifier) onDrawerMenuTapped;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.onPrimaryContainer,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.food_bank,
                  size: 48,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Some Data')
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.emoji_food_beverage),
            title: Text('Meals'),
            onTap: () {
              onDrawerMenuTapped('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.filter),
            title: Text('Filters'),
            onTap: () {
              onDrawerMenuTapped('filters');
            },
          )
        ],
      ),
    );
  }
}

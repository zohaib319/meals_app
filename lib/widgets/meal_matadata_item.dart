import 'package:flutter/material.dart';

class MealMatadataItem extends StatelessWidget {
  const MealMatadataItem(
      {super.key, required this.iconData, required this.name});

  final IconData iconData;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 10.0,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
              ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../meals_screen/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const String route = '/favorite-meals';
  final List<Meal> favoriteMeals;

  FavoritesScreen(
    this.favoriteMeals,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: favoriteMeals.isEmpty
            ? Text('Add some favorites!')
            : Column(
                children: [
                  ...favoriteMeals.map((element) {
                    return MealItem(element);
                  }).toList()
                ],
              ));
  }
}

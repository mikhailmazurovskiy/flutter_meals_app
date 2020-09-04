import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/meals_screen/meal_item.dart';
import '../../models/category.dart';
import '../../static_data/dummy_data.dart';

class MealsScreen extends StatelessWidget {
  // final Category category;

  // MealsScreen(
  //   this.category,
  // );
  static const String route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgCategory =
        ModalRoute.of(context).settings.arguments as Category;

    final mealsForCategory = DUMMY_MEALS
        .where((element) => element.categories.contains(routeArgCategory.id))
        .toList();

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('${routeArgCategory.title} Meals'),
        ),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              mealsForCategory[index],
            );
          },
          itemCount: mealsForCategory.length,
        ));
  }
}

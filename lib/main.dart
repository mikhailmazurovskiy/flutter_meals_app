import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen/categories_screen.dart';
import 'package:flutter_meals_app/screens/favorites_screen/favorites_screen.dart';
import './models/meal.dart';
import 'package:flutter_meals_app/screens/detail_meal_screen/detail_meal_screen.dart';
import 'package:flutter_meals_app/screens/meals_screen/meals_screen.dart';
import 'package:flutter_meals_app/screens/tabs_screen/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> favoriteMeals = [];

  bool _isFavorite(Meal meal) {
    return favoriteMeals.any((element) => element == meal);
  }

  void _toggleFavorites(Meal meal) {
    int indexOfMeal = favoriteMeals.indexOf(meal);
    if (indexOfMeal == -1) {
      setState(() {
        favoriteMeals.add(meal);
      });
    } else {
      setState(() {
        favoriteMeals.remove(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.pink.shade400,
        ),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
          ),
        ),
        accentTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        MealsScreen.route: (ctx) => MealsScreen(),
        DetailMealScreen.route: (ctx) => DetailMealScreen(_toggleFavorites, _isFavorite),
        FavoritesScreen.route: (ctx) => FavoritesScreen(favoriteMeals),
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen/categories_screen.dart';
import 'package:flutter_meals_app/screens/meals_screen/meals_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Meals App Demo',
      theme: CupertinoThemeData(
        barBackgroundColor: Colors.amber,
        primaryColor: Colors.amber,
        primaryContrastingColor: Colors.pink,
        textTheme: CupertinoTextThemeData(
          actionTextStyle: TextStyle(
            color: Colors.blue.shade700,
            fontFamily: 'Raleway',
          ),
          textStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      routes: {
        '/' : (ctx) => CategoriesScreen(),
        MealsScreen.route: (ctx) => MealsScreen(),
      }
    );
  }
}

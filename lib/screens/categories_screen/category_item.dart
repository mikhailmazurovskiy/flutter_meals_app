import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../meals_screen/meals_screen.dart';
import '../../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({
    this.category
  });

  void selectCategory(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(
      MealsScreen.route,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context, category),
      child: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            category.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

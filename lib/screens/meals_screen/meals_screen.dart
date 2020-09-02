import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/category.dart';

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

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('${routeArgCategory.title} Meals'),
      ),
      child: ListView.builder(itemBuilder: (ctx, index) {

      }, itemCount: ,)
    );
  }
}

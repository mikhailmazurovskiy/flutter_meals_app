import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/meal.dart';

class DetailMealScreen extends StatelessWidget {
  static const String route = '/category-meals/details-meal';

  Widget buildSectionTitle(BuildContext context, String sectionTitle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        sectionTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildWrappingContainer(Widget child) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 250,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          meal.title,
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildWrappingContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        meal.ingredients[index],
                      ),
                    ),
                  ),
                  itemCount: meal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildWrappingContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              CupertinoTheme.of(context).barBackgroundColor,
                          child: Text('# ${(index + 1)}',
                              style: TextStyle(
                                  color: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle
                                      .color)),
                        ),
                        title: Text(
                          meal.steps[index],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: meal.steps.length,
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

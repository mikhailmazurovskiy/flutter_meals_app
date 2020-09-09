import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/meal.dart';

class DetailMealScreen extends StatelessWidget {
  static const String route = '/category-meals/details-meal';
  final Function _toggleFavorites;
  final Function _isFavorite;

  DetailMealScreen(
    this._toggleFavorites,
    this._isFavorite,
  );

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
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
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        child: Text('# ${(index + 1)}'),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavorite(meal) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => _toggleFavorites(meal),
      ),
    );
  }
}

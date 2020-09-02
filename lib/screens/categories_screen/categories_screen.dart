import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../static_data/dummy_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: FlatButton(
          child: Text(
            'Filter',
            style: CupertinoTheme.of(context).textTheme.actionTextStyle,
          ),
          onPressed: () => null,
        ),
        middle: Text(
          'Meals App Demo',
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: DUMMY_CATEGORIES
                    .map(
                      (catData) => CategoryItem(category: catData),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

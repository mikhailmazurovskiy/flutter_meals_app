import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../static_data/dummy_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(        
        margin: EdgeInsets.all(10),
        child: Container(
              height: MediaQuery.of(context).size.height * 0.81,
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
    );
  }
}

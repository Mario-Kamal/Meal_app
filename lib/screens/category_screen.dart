import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: EdgeInsets.all(10),
          children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id, catData.title, catData.color)).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
          )),
    );
  }
}

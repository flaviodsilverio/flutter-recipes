import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';

class CategoryMeals extends StatelessWidget {
  // final Category category;

  // CategoryMeals(this.category);
  static const routeName = "CategoryMeals";

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title
          ),
      ),
      body: Center(
        child: Text(
          category.title
          ),
      ),
    );
  }
}

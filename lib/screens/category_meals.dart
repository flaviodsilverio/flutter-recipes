import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  // final Category category;

  // CategoryMeals(this.category);
  static const routeName = "CategoryMeals";

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(category.id);
      }
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title
          ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);//Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

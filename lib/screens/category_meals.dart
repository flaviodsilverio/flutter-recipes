import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/widgets/meal_item.dart';
import 'package:recipes/models/meal.dart';

class CategoryMeals extends StatefulWidget {
  // final Category category;

  // CategoryMeals(this.category);
  static const routeName = "CategoryMeals";

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final category = ModalRoute.of(context).settings.arguments as Category;

      categoryTitle = category.title;
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              meal: displayedMeals[index],
              removeItem: _removeMeal); //Text(categoryMeals[index].title);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

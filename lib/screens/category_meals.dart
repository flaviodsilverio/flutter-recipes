import 'package:flutter/material.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/widgets/meal_item.dart';
import 'package:recipes/models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = "CategoryMeals";

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

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
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: displayedMeals.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(meal: displayedMeals[index]);
              },
              itemCount: displayedMeals.length,
            )
          : Center(child: Text("There are no meals for the selected filters")),
    );
  }
}

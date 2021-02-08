import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Container(
        child: Center(child: Text("You  have no favourites yet!")),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              meal: favouriteMeals[index]); //Text(categoryMeals[index].title);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}

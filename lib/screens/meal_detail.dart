import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "meal-detail";
  
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
          body: Center(
        child: Text("The meal"),
      ),
    );
  }
}
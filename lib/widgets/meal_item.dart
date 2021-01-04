import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetail.routeName, 
      arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(meal.imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 370,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MealInfoItem(icon: Icons.schedule, text: meal.duration.toString() + " min"),
                    MealInfoItem(icon: Icons.work, text: meal.complexityText),
                    MealInfoItem(icon: Icons.money, text: meal.affordabilityText)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MealInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  MealInfoItem({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(text)
      ],
    );
  }
}

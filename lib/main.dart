import 'package:flutter/material.dart';
import 'package:recipes/screens/category_meals.dart';
import 'package:recipes/screens/filters.dart';
import 'package:recipes/screens/meal_detail.dart';
import 'package:recipes/screens/tabs.dart';
import 'screens/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline4: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetail.routeName: (ctx) => MealDetail(),
        FiltersScreen.routeName: (ctx) => FiltersScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

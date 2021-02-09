import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/models/filter.dart';
import 'package:recipes/screens/category_meals.dart';
import 'package:recipes/screens/filters.dart';
import 'package:recipes/screens/meal_detail.dart';
import 'package:recipes/screens/tabs.dart';
import 'screens/categories.dart';
import 'package:recipes/models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Filter> _filters = [
    Filter(type: FilterType.vegan, value: false),
    Filter(type: FilterType.vegetarian, value: false),
    Filter(type: FilterType.dairyFree, value: false),
    Filter(type: FilterType.glutenFree, value: false),
  ];

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(List<Filter> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS;

      _filters.forEach((filter) {
        if (filter.value) {
          if (filter.type == FilterType.vegan) {
            _availableMeals =
                _availableMeals.where((element) => element.isVegan).toList();
          }
          if (filter.type == FilterType.vegetarian) {
            _availableMeals = _availableMeals
                .where((element) => element.isVegetarian)
                .toList();
          }
          if (filter.type == FilterType.glutenFree) {
            _availableMeals = _availableMeals
                .where((element) => element.isGlutenFree)
                .toList();
          }
          if (filter.type == FilterType.dairyFree) {
            _availableMeals = _availableMeals
                .where((element) => element.isLactoseFree)
                .toList();
          }
        }
      });
    });
  }

  void _toggleFavourite(String mealID) {
    final existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

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
        "/": (ctx) => TabsScreen(_favouriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

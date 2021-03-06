import 'package:flutter/material.dart';
import 'package:recipes/screens/categories.dart';
import 'package:recipes/screens/favourites.dart';
import 'package:recipes/widgets/main_drawer.dart';
import 'package:recipes/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {"view": CategoriesScreen(), "title": "Categories"},
      {"view": FavouritesScreen(widget.favouriteMeals), "title": "Favourites"}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(_pages[_selectedPageIndex]["title"])),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]["view"],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
          ],
        ),
      ),
    );
  }
}

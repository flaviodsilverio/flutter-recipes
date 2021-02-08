import 'package:flutter/material.dart';
import 'package:recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _vegetarian = widget.currentFilters["vegetarian"];
    _vegan = widget.currentFilters["vegan"];
    _lactoseFree = widget.currentFilters["lactose"];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(children: [
            _buildSwitchListTile(
                "Gluten-free", "Include only Gluten-free options", _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = !_glutenFree;
              });
            }),
            _buildSwitchListTile("Lactose-free",
                "Include only Lactose-free options", _lactoseFree, (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile("Vegan", "Include only Vegan options", _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(
                "Vegetarian", "Include only Vegetarian options", _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            })
          ])),
        ],
      ),
    );
  }
}

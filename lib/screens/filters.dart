import 'package:flutter/material.dart';
import 'package:recipes/models/filter.dart';
import 'package:recipes/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final List<Filter> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
              child: ListView.builder(
                  itemCount: widget.currentFilters.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _buildSwitchListTile(
                        widget.currentFilters[index].name(),
                        widget.currentFilters[index].description(),
                        widget.currentFilters[index].value, (newValue) {
                      setState(() {
                        widget.currentFilters[index].value =
                            !widget.currentFilters[index].value;
                        widget.saveFilters(widget.currentFilters);
                      });
                    });
                  }))
        ],
      ),
    );
  }
}
